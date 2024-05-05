import 'package:be_friend/common/models/user_entities.dart';
import 'package:be_friend/common/utils/app_colors.dart';
import 'package:be_friend/common/widgets/app_text_fields.dart';
import 'package:be_friend/common/utils/image_res.dart';
import 'package:be_friend/common/widgets/app_buttons.dart';
import 'package:be_friend/common/widgets/app_texts.dart';
import 'package:be_friend/common/widgets/control_animation.dart';
import 'package:be_friend/features/authenticate/controller/auth_controller.dart';
import 'package:be_friend/features/authenticate/view/widgets/auth_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  late final UserRequestEntity userInfo;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //didChangeDependencies to control the initialValue of textfield, make screen is not rebuild whenever we enter somthing...
  //just rebuild when we create new Object ( navigator.pushReplaceelemnt)
  @override
  void didChangeDependencies() {
    userInfo = ref.watch(authControllerProvider);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLogin = ref.watch(isLoginProvider);

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
              const LightAuth(),
              SizedBox(height: 25.h),
              AppControlSlideTrandision(
                AppText34(isLogin ? 'Sign In' : 'Sign Up',
                    color: AppColors.primaryElementText,
                    fontWeight: FontWeight.bold),
                begin: const Offset(0.0, -3.0),
                duration: const Duration(milliseconds: 1000),
              ),
              isLogin? SizedBox(height: 200.h) : SizedBox(height: 170.h,),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      !isLogin
                          ? AppControlSlideTrandision(
                              AppTextField(
                                'Username',
                                initialText: userInfo.username,
                                onChanged: (value) {
                                  ref
                                      .read(authControllerProvider.notifier)
                                      .onChange(username: value);
                                },
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Do not leave it blank';
                                  }
                                  return null;
                                },
                              ),
                              duration: const Duration(milliseconds: 300),
                            )
                          : const SizedBox(),
                      SizedBox(height: 15.h),
                      AppControlSlideTrandision(AppTextField(
                        'Email',
                        initialText: userInfo.email,
                        onChanged: (value) {
                          ref
                              .read(authControllerProvider.notifier)
                              .onChange(email: value);
                        },
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty ||
                              !value.contains('@')) {
                            return 'Email is not valid';
                          }
                          return null;
                        },
                      )),
                      SizedBox(height: 15.h),
                      AppControlSlideTrandision(
                        AppTextField(
                          'Password',
                          obscureText: true,
                          initialText: userInfo.password,
                          onChanged: (value) {
                            ref
                                .read(authControllerProvider.notifier)
                                .onChange(password: value);
                          },
                          validator: (value) {
                            if (value == null || value.length < 6) {
                              return 'The password field needs to be greater than 6 characters!';
                            }
                            return null;
                          },
                        ),
                        duration: const Duration(milliseconds: 800),
                      ),
                    ],
                  )),
              SizedBox(height: 25.h),
              AppControlSlideTrandision(
                AppElevatedButton(
                    onTap: () {
                      _formKey.currentState!.validate();
                    },
                    text: isLogin ? 'Login' : 'SignUp',
                    height: 46,
                    fontSize: 20,
                    color: const Color.fromARGB(255, 131, 131, 237),
                    radius: 18),
                duration: const Duration(milliseconds: 1100),
              ),
              SizedBox(height: 28.h),
              AppControlSlideTrandision(
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  AppText10(
                    isLogin
                        ? 'Don\'t have an account?'
                        : 'You already had an account?',
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(width: 3.w),
                  GestureDetector(
                      onTap: () {
                        ref.read(isLoginProvider.notifier).isSignIn(!isLogin);
                        //Refesh animation
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const AuthScreen(),
                        ));
                      },
                      child: AppText10(
                        isLogin ? 'SignUp' : 'SignIn',
                        color: AppColors.primaryElement,
                      ))
                ]),
                begin: const Offset(0, 2.0),
                duration: const Duration(milliseconds: 1500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
