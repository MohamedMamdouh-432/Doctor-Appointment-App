import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testing_app/core/theming/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class HeadlineSection extends StatelessWidget {
  const HeadlineSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          'Create Account'.text
              .size(24.sp)
              .bold
              .color(ColorsManager.mainBlue)
              .make(),
          Gap(10.h),
          "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!"
              .text
              .size(14.sp)
              .color(ColorsManager.gray)
              .make(),
        ],
      ),
    );
  }
}
