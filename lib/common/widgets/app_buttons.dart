import 'package:be_friend/common/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppElevatedButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final double? width;
  final double? height;
  final double? radius;
  final double? fontSize;
  final Color? color;
  const AppElevatedButton(
      {super.key,
      required this.text,
      this.onTap,
      this.width = 325,
      this.height = 65,
      this.fontSize = 25,
      this.color = AppColors.primaryElement,
      this.radius = 35});
  @override
  Widget build(context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width!.w,
        height: height!.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [color!.withOpacity(0.85), color!]),
          borderRadius: BorderRadius.circular(radius!),
        ),
        child: Text(text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryElementText,
                fontSize: fontSize!.sp)),
      ),
    );
  }
}
