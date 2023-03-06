import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scan_task/core/styles/colors.dart';
import 'package:scan_task/gen/fonts.gen.dart';

class AppButton extends StatelessWidget {
  final double? width;
  final double? top;
  final double? bottom;
  final double? start;
  final double? end;
  final double? height;
  final Color? color;
  final String title;

  final void Function()? onTap;

  const AppButton(
      {Key? key,
      this.width,
      this.height,
      this.color,
      required this.title,
      this.onTap, this.top, this.bottom, this.start, this.end})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsetsDirectional.only(top: top??0,bottom: bottom??0,end:end??0 ,start: start??0),
        child: Container(
          width: width ?? double.infinity,
          height: height ?? 58.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.w),
            color: color ?? primaryColor,
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: const Color(0xffFFFFFF),
                  fontSize: 16.sp,
                  fontFamily: FontFamily.regular),
            ),
          ),
        ),
      ),
    );
  }
}
