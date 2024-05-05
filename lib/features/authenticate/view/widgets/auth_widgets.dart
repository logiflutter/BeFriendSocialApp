import 'package:be_friend/common/utils/image_res.dart';
import 'package:be_friend/common/widgets/control_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LightAuth extends StatelessWidget {
  const LightAuth({super.key});

  @override
  Widget build(context) {
    final double width = MediaQuery.of(context).size.width;
    return Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.1.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppControlSlideTrandision(
                Image.asset(ImageRes.light, width: 75.w),
                curve: Curves.bounceOut,
                duration: const Duration(seconds: 2),
                begin: const Offset(0.0, -2.0),
                isRepeat: true,
              ),
              AppControlSlideTrandision(
                Image.asset(ImageRes.light, width: 55.w,),
                curve: Curves.bounceInOut,
                duration: const Duration(seconds: 2),
                begin: const Offset(0.0, -2.0),
                isRepeat: true,
              ),
          ]),
        );
  }
}
