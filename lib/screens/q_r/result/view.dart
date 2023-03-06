import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:scan_task/core/items/scan_item.dart';
import 'package:scan_task/core/widgets/app_button.dart';
import 'package:scan_task/core/widgets/navigate.dart';
import 'package:scan_task/screens/q_r/result/bloc/bloc.dart';
import 'package:scan_task/screens/q_r/result/bloc/events.dart';
import 'package:scan_task/screens/q_r/result/bloc/states.dart';

import '../../../gen/assets.gen.dart';
import '../scan/view.dart';


class ScanningResult extends StatelessWidget {
  final bloc = KiwiContainer().resolve<ScanResultBloc>()
    ..add(ScanResultGetEvent());

  ScanningResult({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            color: Colors.black,
            width: double.infinity,
            height: 101.h,
          ),
          Container(
            height: 825.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: (){
                            navigateTo(context, const QrCode());
                          },
                          child: Image.asset(Assets.images.topIcon2.path, height: 43.h,
                            width: 41.w,),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  "Scanning result",
                  style:
                  TextStyle(fontSize: 20.sp,),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  width: 257.w,
                  height: 55.h,
                  child: Text(
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      "Proofreader will keep your last 10 days history to keep your all scared history please purchase our pro package"),
                ),
                SizedBox(
                  height: 10.h,
                ),
                BlocBuilder(
                    bloc: bloc,
                    builder: (BuildContext context, state) {
                      if (state is ScanResultSuccessState) {
                        return Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: 61.r, end: 61.r, bottom: 41.r),
                          child: SizedBox(
                            height: 366.h,
                            child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return ScanItem(code:state.scanModel.data![index].code!,);
                                },
                                separatorBuilder: ((context, index) =>
                                    SizedBox(
                                      height: 10.h,
                                    )),
                                itemCount: 11),
                          ),
                        );
                      }else {
                        return const CircularProgressIndicator();
                      }
                    }

                ),
                AppButton(title: 'Send', width: 319.w,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
