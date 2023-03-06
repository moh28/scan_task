import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:scan_task/core/widgets/app_button.dart';
import 'package:scan_task/core/widgets/app_input.dart';
import 'package:scan_task/core/widgets/navigate.dart';

import '../../../gen/assets.gen.dart';
import '../../q_r/scan/view.dart';
import 'bloc/bloc.dart';
import 'bloc/events.dart';
import 'bloc/states.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final bloc = KiwiContainer().resolve<LogInBloc>();
  final event = LogInPostEvent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 20.r),
                  child: Image.asset(
                    Assets.images.head2.path,
                    height: 204.h,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 207.r),
                  child: Image.asset(
                    Assets.images.head1.path,
                    height: 175.h,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 126.r, right: 181.r, left: 181.r),
                  child: Text(
                    "Login",
                    style:
                        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AppInput(
                    top: 104.h,
                    start: 21.r,
                    end: 27.r,
                    bottom: 16.h,
                    controller: event.phoneController,
                    validate: (String? value) {
                      return null;
                    },
                    hint: 'Enter Your Phone',
                  ),
                  AppInput(
                    controller: event.passwordController,
                    top: 11.34.r,
                    validate: (String? value) {
                      return null;
                    },
                    secureText: true,
                    start: 21.r,
                    bottom: 24.h,
                    end: 27.r,
                    suffix: IconButton(
                      icon: const Icon(
                        Icons.remove_red_eye,
                      ),
                      onPressed: () {},
                    ),
                    hint: 'password',
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(end: 32.r),
                    child: const Text(
                      "Forget password?",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            BlocConsumer(
              bloc: bloc,
              builder: (context, state) {
                return AppButton(
                  top: 43.r,
                  title: 'Login',
                  start: 51.r,
                  end: 58.r,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      bloc.add(event);
                    }
                  },
                );
              },
              listener: (BuildContext context, Object? state) {
                if (state is LogInSuccessState) {
                  navigateAndFinish(context, const QrCode());
                } else if (state is LogInErrorState) {
                  showToast(text: state.msg, state: ToastStates.ERROR);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
