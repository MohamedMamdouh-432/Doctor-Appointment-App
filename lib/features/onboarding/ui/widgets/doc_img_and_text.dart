import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testing_app/core/theming/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class DocImgAndText extends StatelessWidget {
  const DocImgAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset('assets/svgs/docdoc_logo_low_opacity.svg'),
        Image.asset('assets/images/onboarding_doctor.png'),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            alignment: Alignment.center,
            color: Colors.white.withValues(alpha: 0.8),
            child: 'Best Doctor Appointment App'.text
                .size(32.sp)
                .color(ColorsManager.mainBlue)
                .bold
                .lineHeight(1.4)
                .makeCentered(),
          ),
        ),
      ],
    );
  }
}
