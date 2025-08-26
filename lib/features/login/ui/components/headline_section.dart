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
      margin: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          'Welcome Back'.text
              .size(24.sp)
              .bold
              .color(ColorsManager.mainBlue)
              .make(),
          Gap(10.h),
          "We're excited to have you back, can't wait to see what you've been up to since you last logged in."
              .text
              .size(14.sp)
              .color(ColorsManager.gray)
              .make(),
        ],
      ),
    );
  }
}
