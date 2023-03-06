class ScanStates {}

class ScanInitialState extends ScanStates {}

class ScanLoadingState extends ScanStates {}

class ScanSuccessState extends ScanStates {

}

class ScanErrorState extends ScanStates {
  final String msg;

  ScanErrorState(this.msg);
}