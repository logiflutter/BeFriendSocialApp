import 'package:be_friend/common/utils/image_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LightSignIn extends StatefulWidget {
  const LightSignIn({super.key});

  @override
  State<LightSignIn> createState() => _LightSignInState();
}

class _LightSignInState extends State<LightSignIn> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;
  late final Animation<Offset> _secondOffsetAnimation;

  @override
  void initState() {
    super.initState();
    //init Animation Controller.
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this)..repeat(reverse: true);
    
    //Init Amimation<Offset> use _controller
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -2) ,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));

    _secondOffsetAnimation = Tween(
      begin: const Offset (0, -2),
      end: Offset.zero
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));

    // _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(context) {
    final double width = MediaQuery.of(context).size.width;
    return Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.1.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SlideTransition(
                position: _offsetAnimation,
                child: Image.asset(ImageRes.light, width: 75.w)),
              SlideTransition(
                position: _secondOffsetAnimation,
                child: Image.asset(ImageRes.light, width: 55.w,)),
          ]),
        );
  }
}
