import 'package:be_friend/common/utils/app_colors.dart';
import 'package:be_friend/common/widgets/app_alert.dart';
import 'package:be_friend/common/widgets/app_text_fields.dart';
import 'package:be_friend/common/utils/image_res.dart';
import 'package:be_friend/common/widgets/app_buttons.dart';
import 'package:be_friend/common/widgets/app_texts.dart';
import 'package:be_friend/features/sign_in/view/widgets/sign_in_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _slideAnimation = Tween<double>(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          width: double.infinity,
          height: 812.h,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageRes.bgLogin),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const LightSignIn(),
              SizedBox(height: 25.h),
              const AppText34('Sign Up',
                  color: AppColors.primaryElementText,
                  fontWeight: FontWeight.bold),
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, 1.0),
                  end: Offset.zero,
                ).animate(_controller),
                child: Column(children: [
                  SizedBox(height: 200.h),
                  const AppTextField('Email'),
                  SizedBox(height: 15.h),
                  const AppTextField('Password', obscureText: true),
                  SizedBox(height: 25.h),
                  const AppElevatedButton(
                      text: 'SignUp',
                      height: 46,
                      fontSize: 20,
                      color: Color.fromARGB(255, 131, 131, 237),
                      radius: 18),
                  SizedBox(height: 28.h),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const AppText10(
                      'Don\'t have an account?',
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(width: 3.w),
                    GestureDetector(
                        onTap: () {
                          AppAlert.showToast('ok');
                        },
                        child: const AppText10(
                          'SignUp',
                          color: AppColors.primaryElement,
                        ))
                  ]),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
