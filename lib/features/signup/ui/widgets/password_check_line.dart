import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testing_app/core/theming/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class PasswordCheckLine extends StatelessWidget {
  final String line;
  final bool isValidated;

  const PasswordCheckLine(this.line, this.isValidated, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isValidated ? '✅'.text.make() : '☑️'.text.make(),
        Gap(15.w),
        line.text.size(14.sp).color(ColorsManager.gray).make(),
      ],
    );
  }
}
