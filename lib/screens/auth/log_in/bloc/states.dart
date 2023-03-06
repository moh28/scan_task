class LogInStates {}

class LogInInitialState extends LogInStates {}

class LogInLoadingState extends LogInStates {}

class LogInSuccessState extends LogInStates {

}

class LogInErrorState extends LogInStates {
  final String msg;

  LogInErrorState(this.msg);
}