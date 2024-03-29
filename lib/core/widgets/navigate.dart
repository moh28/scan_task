import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scan_task/core/styles/colors.dart';


Future<dynamic> navigateTo(context, Widget)async {
  return Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));
}

void navigateAndFinish(context, Widget) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => Widget), (route) => false);
}

Widget circularProgress() {
  return const CircularProgressIndicator(color: primaryColor);
}

void showToast({required String text, required ToastStates state}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: const Color(0xff333739),
        fontSize: 16.0);

enum ToastStates { SUCCESS, ERROR, WARNING }

Color? chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = const Color(0xff4C8613);
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;

    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}
