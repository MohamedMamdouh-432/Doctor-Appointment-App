import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testing_app/core/theming/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class GenericTextField extends StatelessWidget {
  final String hint;
  final IconData preIcon;
  final IconData? sufIcon;
  final bool isObsecure;

  const GenericTextField({
    super.key,
    required this.hint,
    required this.preIcon,
    this.sufIcon,
    this.isObsecure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ColorsManager.brighterGray, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          gapPadding: 10.0,
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ColorsManager.mainBlue, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          gapPadding: 10.0,
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ColorsManager.brightRed, width: 2.0),
        ),
        filled: true,
        fillColor: ColorsManager.brightestGray,
        hint: hint.text.size(14.sp).color(ColorsManager.brightGray).make(),
        prefixIcon: Icon(preIcon, color: ColorsManager.gray),
        suffixIcon: sufIcon != null
            ? Icon(sufIcon, color: ColorsManager.gray)
            : null,
      ),
      obscureText: isObsecure,
      style: TextStyle(color: ColorsManager.darkBlue, fontSize: 14.sp),
    );
  }
}
