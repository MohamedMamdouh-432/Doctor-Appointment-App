import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testing_app/core/theming/text_styles.dart';
import 'package:testing_app/features/onboarding/ui/widgets/doc_img_and_text.dart';
import 'package:testing_app/features/onboarding/ui/widgets/doc_logo_and_name.dart';
import 'package:testing_app/features/onboarding/ui/widgets/get_started_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
            child: Column(
              children: [
                DocLogoAndName(),
                Gap(30.h),
                DocImgAndText(),
                Gap(20.h),
                Text(
                  'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                  style: TextStyles.font14NormalGray,
                  textAlign: TextAlign.center,
                ),
                Gap(30.h),
                GetStartedButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
