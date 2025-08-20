import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testing_app/core/theming/text_styles.dart';

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
            child: Text(
              'Best Doctor Appointment App',
              style: TextStyles.font32BoldBlue.copyWith(height: 1.4),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
