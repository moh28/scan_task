import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/fonts.gen.dart';
import '../styles/colors.dart';
class AppInput extends StatelessWidget {
  final Widget?suffix;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSubmitted;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validate;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? start;
  final double? end;
  final double? top;
  final double? bottom;
  final TextInputType? inputType;
  final String? label;
  final String? hint;
  final bool? secureText;
  final bool? isEnabled;
  final bool? autofocus;
  final Color? color;
  final Color? iconColor;
  final TextEditingController? controller;
  final Color? borderColor;

  const AppInput(
      {Key? key,
        this.onChanged,
        this.validate,
        this.prefixIcon,
        this.suffixIcon,
        this.inputType,
        this.label,
        this.hint,
        this.secureText,
        this.onSubmitted,
        this.isEnabled = true,
        this.controller,
        this.color,
        this.onSaved,
        this.autofocus,
        this.iconColor,
        this.borderColor, this.start, this.end, this.top, this.bottom, this.suffix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          end: end ?? 0, start: start ?? 0,top:top?? 0,bottom:bottom?? 0),
      child: SizedBox(
        width: double.infinity,
        height: 58.h,
        child: TextFormField(

          enabled: isEnabled ?? true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          onFieldSubmitted: onSubmitted,
          style: const TextStyle(color: primaryColor, fontSize: 20),
          obscureText: secureText ?? false,
          cursorColor: primaryColor,
          keyboardType: inputType ?? TextInputType.text,
          validator: validate,
          onSaved: onSaved,
          autofocus: autofocus ?? false,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.w),
              borderSide: const BorderSide(
                color: authBorderColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular( 5.w),
              borderSide: const BorderSide(color: primaryColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular( 5.w),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular( 5.w),
              borderSide: const BorderSide(color: Colors.red),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular( 5.w),
              borderSide:  const BorderSide(color:  authBorderColor),
            ),
            contentPadding:  EdgeInsets.only(
                right: 17.0.r, top: 17.0.r, bottom: 17.0.r, left: 17.0.r),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(color: primaryColor),
            ),
            filled: true,
            fillColor: color ?? const Color(0xFFFFFFFF),
            prefixIcon: prefixIcon,
            suffix: suffix,
            suffixIcon: suffixIcon,
            suffixIconConstraints:
            const BoxConstraints(maxHeight: 35, maxWidth: 45),
            labelText: label,
            labelStyle: TextStyle(
              fontSize: 15.sp,
              fontFamily: FontFamily.regular,
              color: const Color(0xffAFAFAF),
            ),
            hintStyle: const TextStyle(
                fontFamily: FontFamily.regular,
                fontSize: 15, color: Color(0xffAFAFAF) ),
            hintText: hint,
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}