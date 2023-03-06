import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:scan_task/core/styles/colors.dart';
import 'package:scan_task/core/widgets/app_button.dart';
import 'package:scan_task/core/widgets/navigate.dart';
import 'package:scan_task/gen/fonts.gen.dart';
import 'package:scan_task/screens/q_r/scan/bloc/events.dart';
import 'package:scan_task/screens/q_r/scan/bloc/states.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../result/view.dart';
import 'bloc/bloc.dart';

class QrCode extends StatefulWidget {
  const QrCode({Key? key}) : super(key: key);

  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  final bloc = KiwiContainer().resolve<ScanBloc>();
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    /*if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(top: 101.r),
              child: Container(
                height: 825.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      height: 3.h,
                      width: 60.w,
                      color: Colors.grey.withOpacity(.5),
                    ),
                    BlocConsumer(
                      bloc: bloc,
                      builder: (BuildContext context, state) {
                        return Padding(
                          padding: EdgeInsetsDirectional.only(
                              top: 11.r, end: 23.r),
                          child: GestureDetector(
                            onTap: () {
                              navigateTo(context, ScanningResult());
                            },
                            child: Row(mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  child: Image.asset(
                                    Assets.images.topIcon.path, height: 39.h,
                                    width: 39.w,),
                                ),
                              ],
                            ),
                          ),
                        );
                      }, listener: (BuildContext context, Object? state) {
                      if (state is ScanSuccessState) {
                        showToast(text: 'sjsjd', state: ToastStates.SUCCESS);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScanningResult()));
                      } else {
                        showToast(text: 'sjsjd', state: ToastStates.ERROR);
                        const CircularProgressIndicator();
                      }
                    },

                    ),
                    SizedBox(height: 81.h,),
                    Text(
                      "Scan QR code",
                      style:
                      TextStyle(fontSize: 20.sp, fontFamily: FontFamily.bold),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Container(
                      height: 37.h,
                      width: 261.w,
                      child: Text(
                          style: TextStyle(fontSize: 12.sp,),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          "place QR code inside the frame to scan please avoid shake to get the result quickly"),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Container(
                      height: 180.h,
                      width: 180.w,
                      child: _buildQrView(context),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 17.r),
                      child: SizedBox(
                        height: 15.h,
                        width: 96.w,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              if (result != null)
                                const Text(
                                    'Scanned Successfully')
                              else
                                const Text('Scanning a code'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 44.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.images.collections24px.path, height: 16.h,
                          width: 16.w,),
                        SizedBox(width: 21.w,),
                        Image.asset(
                          Assets.images.blurLinear24px.path, height: 18.h,
                          width: 26.w,),
                        SizedBox(width: 21.w,),
                        GestureDetector(child: Image.asset(Assets.images
                            .flashOn24px.path, height: 20.h, width: 10.w,),
                          onTap:() async {
                            await controller?.toggleFlash();
                            setState(() {});
                          },
                        )

                      ],),
                    AppButton(
                      top: 26.r,
                      title: 'Place camera code',
                      width: 250.w,
                      height: 58.h,
                      onTap: () {
                        controller?.resumeCamera();
                      },)
                  ],
                ),
              ),
            )
          ]),
        ));
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = 190.sp;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: primaryColor,
          borderRadius: 21.w,
          borderLength: 30,
          borderWidth: 5,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        controller.pauseCamera();
        result = scanData;
        print('++++++++++++++++ssgsgg${scanData.code}');
        bloc.add(ScanPostEvent(scanData));
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}