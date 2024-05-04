import 'package:be_friend/common/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  final String text;
  final Function(String value)? onChanged;
  final TextEditingController? controller;
  final double? width;
  final double? height;
  final double? radius;
  final Color? color;
  final Color? bgColor;
  final bool? obscureText;
  const AppTextField(this.text,
      {super.key,
      this.onChanged,
      this.controller,
      this.color = AppColors.primaryThreeElementText,
      this.bgColor = const Color.fromARGB(255, 249, 244, 244),
      this.height = 50,
      this.width = double.infinity,
      this.radius = 16,
      this.obscureText = false});
  @override
  Widget build(context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: width!.w,
      height: height!.h,
      padding: EdgeInsets.symmetric(horizontal: 13.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius!),
        color: bgColor,
      ),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        obscureText: obscureText!,
        autocorrect: false,
        decoration: InputDecoration(
          label: Text(
            text,
            style: TextStyle(
                fontSize: 10.sp, color: color, fontWeight: FontWeight.bold),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
