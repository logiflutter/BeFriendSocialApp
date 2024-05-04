import 'package:be_friend/common/utils/app_colors.dart';
import 'package:be_friend/common/utils/image_res.dart';
import 'package:be_friend/common/widgets/app_buttons.dart';
import 'package:be_friend/features/onboarding/provider/onboarding_provider.dart';
import 'package:be_friend/features/onboarding/view/widgets/onboarding_widgets.dart';
import 'package:be_friend/features/sign_in/view/sign_in.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OnboardingScreen extends ConsumerStatefulWidget {
  OnboardingScreen({super.key});
  final PageController controller = PageController();
  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreen();
}

class _OnboardingScreen extends ConsumerState<OnboardingScreen> {
  late PageController controller;
  @override
  void initState() {
    super.initState();
    controller = PageController();
  }
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
  
  @override
  Widget build(context) {
    final index = ref.watch(onboardingProvider);
    List<Widget> pages = const [
                  OnboardingWidget1(),
                  OnboardingWidget2(
                    image: ImageRes.peopleNoBackground,
                    title: 'Connect with many friends in the world!',
                    subTitle:
                        'We are BeFriend, not like Facebook or any other social network apps, so let try now !',
                  ),
                  OnboardingWidget2(
                      image: ImageRes.threePeopleRemoveBg,
                      title: 'What are you watting for, ready guy?',
                      subTitle:
                          'Go now with us, we will make happy and have so many fun on this app!'),
                ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 25.w),
          child: Stack(
            children: [
              PageView(
                onPageChanged: (value) {
                  ref.read(onboardingProvider.notifier).changIndex(value);
                },
                controller: controller,
                children: pages,
              ),
              Positioned(
                bottom: 0,
                child: Column(children: [
                  DotsIndicator(
                    dotsCount: 3,
                    position: index,
                    decorator: const DotsDecorator(
                      activeColor: AppColors.primaryElement,
                    ),
                    onTap: (position) {
                      controller.animateToPage(position, duration: const Duration(milliseconds: 300), curve: Curves.linear);
                    },
                  ),
                  SizedBox(height: 50.h),
                  AppElevatedButton(
                    text: index < pages.length -1 ? 'NEXT' : 'I\'M READY',
                    onTap: () {
                      if(index < pages.length - 1) {
                      controller.animateToPage(index + 1, duration: const Duration(milliseconds: 300), curve: Curves.linear);
                      } else {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                          return const SignInScreen();
                        }));
                      }
                    },
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
