import 'package:be_friend/common/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  final String text;
  final Function(String value)? onChanged;
  final TextEditingController? controller;
  final double? width;
  final double? radius;
  final EdgeInsets? contentPadding;
  final Color? color;
  final Color? bgColor;
  final bool? obscureText;
  final String? initialText;
  final String? Function(String? value)? validator;
  const AppTextField(this.text,
      {super.key,
      this.onChanged,
      this.controller,
      this.color = AppColors.primaryThreeElementText,
      this.bgColor = const Color.fromARGB(255, 249, 244, 244),
      this.width = double.infinity,
      this.radius = 16,
      this.obscureText = false,
      this.initialText = '',
      this.validator,
      this.contentPadding = const  EdgeInsets.symmetric(horizontal: 25, vertical: 18)});
  @override
  Widget build(context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: width!.w,
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        obscureText: obscureText!,
        autocorrect: false,
        initialValue: initialText,
        validator: validator,
        decoration: InputDecoration(
          label: Text(text, style: TextStyle(fontSize: 10.sp, color: color, fontWeight: FontWeight.bold)),
          contentPadding: contentPadding,
          filled: true,
          fillColor: bgColor,
          // border: _outlineTransparent(radius: radius!),
          enabledBorder: _outlineTransparent(radius: radius!),
          focusedBorder: _outlineTransparent(radius: radius!),
          // disabledBorder: _outlineTransparent(radius: radius!),
          errorBorder: _outlineError(radius: radius!),
          focusedErrorBorder: _outlineError(radius: radius!),
        ),
      ),
    );
  }
  OutlineInputBorder _outlineTransparent({required double radius}) =>
      OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(radius),
      );

  OutlineInputBorder _outlineError({required double radius}) =>
      OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.circular(radius),
      );
}
