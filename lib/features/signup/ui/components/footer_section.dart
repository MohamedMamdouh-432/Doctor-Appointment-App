import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:testing_app/core/routing/routes.dart';
import 'package:testing_app/core/theming/colors.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20.h,
      children: [
        Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            style: TextStyle(fontSize: 13.sp),
            children: [
              TextSpan(
                text: 'By signing up, you agree to our ',
                style: TextStyle(color: ColorsManager.brightGray),
              ),
              TextSpan(
                text: 'Terms & Conditions',
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(
                text: ' and ',
                style: TextStyle(color: ColorsManager.brightGray),
              ),
              TextSpan(
                text: 'Privacy Policy.',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(fontSize: 15.sp),
            children: [
              TextSpan(
                text: 'Already have an account? ',
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(
                text: 'Login',
                style: TextStyle(
                  color: ColorsManager.mainBlue,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => context.push(Routes.loginScreen),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
