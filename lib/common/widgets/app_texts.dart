import 'package:be_friend/common/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppText10 extends StatelessWidget {
  final String? text;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextAlign? textAlign;
  final Color? color;
  const AppText10(this.text,
      {super.key,
      this.fontWeight,
      this.maxLines = 1,
      this.textAlign,
      this.color = AppColors.primaryText});
  @override
  Widget build(context) {
    return Text(
      text!,
      style: TextStyle(
        fontSize: 10.sp,
        fontWeight: fontWeight,
        color: color,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}

class AppText20 extends StatelessWidget {
  final String? text;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextAlign? textAlign;
  final Color? color;
  const AppText20(this.text,
      {super.key,
      this.fontWeight,
      this.maxLines = 1,
      this.textAlign,
      this.color = AppColors.primaryText});
  @override
  Widget build(context) {
    return Text(
      text!,
      style: TextStyle(
        fontSize: 20.sp,
        fontWeight: fontWeight,
        color: color,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}

class AppText24 extends StatelessWidget {
  final String? text;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextAlign? textAlign;
  final Color? color;
  const AppText24(this.text,
      {super.key,
      this.fontWeight,
      this.maxLines = 1,
      this.textAlign,
      this.color = AppColors.primaryText});
  @override
  Widget build(context) {
    return Text(
      text!,
      style: TextStyle(
        fontSize: 24.sp,
        fontWeight: fontWeight,
        color: color,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}

class AppText28 extends StatelessWidget {
  final String? text;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextAlign? textAlign;
  final Color? color;
  const AppText28(this.text,
      {super.key,
      this.fontWeight,
      this.maxLines = 1,
      this.textAlign,
      this.color = AppColors.primaryText});
  @override
  Widget build(context) {
    return Text(
      text!,
      style: TextStyle(
        fontSize: 28.sp,
        fontWeight: fontWeight,
        color: color
      ),
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}

class AppText34 extends StatelessWidget {
  final String? text;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextAlign? textAlign;
  final Color? color;
  const AppText34(this.text,
      {super.key,
      this.fontWeight,
      this.maxLines = 1,
      this.textAlign,
      this.color = AppColors.primaryText});
  @override
  Widget build(context) {
    return Text(
      text!,
      style: TextStyle(
        fontSize: 34.sp,
        fontWeight: fontWeight,
        color: color
      ),
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}

class AppText40 extends StatelessWidget {
  final String? text;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextAlign? textAlign;
  final Color? color;
  const AppText40(this.text,
      {super.key,
      this.fontWeight,
      this.maxLines = 1,
      this.textAlign,
      this.color = AppColors.primaryText});
  @override
  Widget build(context) {
    return Text(
      text!,
      style: TextStyle(
        fontSize: 40.sp,
        fontWeight: fontWeight,
        color: color
      ),
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
