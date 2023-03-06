import 'model.dart';

class ScanResultStates {}

class ScanResultInitialState extends ScanResultStates {}

class ScanResultLoadingState extends ScanResultStates {}

class ScanResultSuccessState extends ScanResultStates {
  final ScanModel scanModel;
  ScanResultSuccessState({required this.scanModel});

}

class ScanResultErrorState extends ScanResultStates {
  final String msg;

  ScanResultErrorState(this.msg);
}