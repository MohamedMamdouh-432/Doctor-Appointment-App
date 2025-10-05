import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:testing_app/core/helpers/cache_helper.dart';
import 'package:testing_app/core/helpers/constants.dart';
import 'package:testing_app/core/routing/routes.dart';
import 'package:testing_app/core/theming/colors.dart';
import 'package:testing_app/core/widgets/generic_button.dart';
import 'package:testing_app/features/onboarding/ui/widgets/doc_img_and_text.dart';
import 'package:testing_app/features/onboarding/ui/widgets/doc_logo_and_name.dart';
import 'package:velocity_x/velocity_x.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
          child: Column(
            children: [
              DocLogoAndName(),
              Gap(30.h),
              DocImgAndText(),
              Gap(20.h),
              'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.'
                  .text
                  .size(14.sp)
                  .color(ColorsManager.gray)
                  .makeCentered(),
              Gap(30.h),
              GenericButton(
                content: 'Get Started',
                onPressed: () async {
                  await CacheHelper.setData(Constants.seenBefore, true);
                  context.go(Routes.loginScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
