import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scan_task/screens/auth/log_in/bloc/events.dart';
import 'package:scan_task/screens/auth/log_in/bloc/states.dart';

import '../../../../core/network/cache_helper.dart';
import '../../../../core/network/server_gate.dart';

class LogInBloc extends Bloc<LogInEvents, LogInStates> {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  LogInBloc() : super((LogInInitialState())) {
    on<LogInPostEvent>(_postLogIn);
  }
  Future<void> _postLogIn(
      LogInPostEvent event, Emitter<LogInStates> emit) async {
    emit(LogInLoadingState());
    try {
      final response = await ServerGate.postData(url: 'login', data:  event.body);
      print(response.data);
      if(response.data["status"] == 1){
            CacheHelper.setUserToken(response.data?["data"]["token"]);
            emit(LogInSuccessState());
      }else{
        emit(LogInErrorState(response.data['message']??""));
      }
      // if(resp.success){
      //

      //
      // }else{
      //   emit(LogInErrorState(resp.msg));
      // }
    } catch (error) {

      emit(LogInErrorState(error.toString()));
    }
  }
}