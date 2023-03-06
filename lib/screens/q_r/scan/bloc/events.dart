import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanEvents {}

class ScanPostEvent extends ScanEvents {
late Barcode result;
  Map<String, dynamic> get body  => {
    'code':result.code
  };
  ScanPostEvent(this.result) ;
}