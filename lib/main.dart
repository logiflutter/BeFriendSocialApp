import 'package:be_friend/common/utils/app_styles.dart';
import 'package:be_friend/features/onboarding/view/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(
              theme: AppTheme.themeData,
              home: OnboardingScreen(),
              debugShowCheckedModeBanner: false,
            ));
  }
}
