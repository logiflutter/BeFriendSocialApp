import 'package:be_friend/common/utils/app_colors.dart';
import 'package:be_friend/common/utils/image_res.dart';
import 'package:be_friend/common/widgets/app_images.dart';
import 'package:be_friend/common/widgets/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingWidget1 extends StatelessWidget {
  const OnboardingWidget1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                const AppImageAsset(
                  image: ImageRes.clap,
                  height: 35,
                  width: 35,
                ),
                SizedBox(height: 15.h),
                const AppText40('Hello!', fontWeight: FontWeight.bold),
                SizedBox(height: 20.h),
              ],
            ),
            const Spacer(),
            Stack(children: [
              Column(children: [
                SizedBox(height: 10.h),
                CircleAvatar(
                  radius: 60.r,
                  backgroundColor:
                      AppColors.primaryElement.withOpacity(0.35),
                ),
              ]),
              Positioned(
                bottom: 10,
                right: 0,
                child: Container(
                  height: 140.h,
                  width: 120.h,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Image.asset(ImageRes.defaultImage)
                ),
              ),
            ]),
          ],
        ),
        const AppText24(
          'Wellcome to BeFriend App. Let\'s make more friends now!',
          maxLines: 3,
        ),
        SizedBox(
          height: 100.h,
        ),
      ],
    );
  }
}

class OnboardingWidget2 extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  const OnboardingWidget2({super.key,required this.image, required this.title, required this.subTitle});
  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppImageAsset(
          image: image,
          width: 200,
          height: 200,
        ),
        SizedBox(height: 20.h),
        AppText28( title, maxLines: 2, textAlign: TextAlign.center, fontWeight: FontWeight.w600,),
        const SizedBox(height: 20),
        AppText20( subTitle, textAlign: TextAlign.center, maxLines: 3),
        SizedBox(height: 120.h),
      ],
    );
  }
}
