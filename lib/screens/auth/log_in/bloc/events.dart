import 'dart:io';

import 'package:flutter/material.dart';



class LogInEvents {}

class LogInPostEvent extends LogInEvents {
  late TextEditingController phoneController,passwordController;
  late String countryCode;

  Map<String, dynamic> get body  => {
    'email': phoneController.text,
    'password': passwordController.text,
  };
  LogInPostEvent() {
    phoneController = TextEditingController();
    passwordController = TextEditingController();
  }
}