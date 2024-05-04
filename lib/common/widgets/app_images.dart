import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppImageAsset extends StatelessWidget {
  final String image;
  final double? width;
  final double? height;
  const AppImageAsset({
    super.key,
    required this.image,
    this.width = 16,
    this.height = 16,
  });
  @override
  Widget build(context) {
    return SizedBox(
      height: height!.h,
      width: width!.w,
      child: Image.asset(image),
    );
  }
}
