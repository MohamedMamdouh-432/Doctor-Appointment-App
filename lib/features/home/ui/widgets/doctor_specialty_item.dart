import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testing_app/core/theming/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class DoctorSpecialtyItem extends StatelessWidget {
  final Map<String, String> doctorSpecialty;

  const DoctorSpecialtyItem(this.doctorSpecialty, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.sp,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 30.sp,
            backgroundColor: ColorsManager.brighterGray,
            child: Image.asset(
              doctorSpecialty['imgUrl']!,
              fit: BoxFit.contain,
              width: 40.sp,
            ),
          ),
          doctorSpecialty['name']!.text.size(14.sp).make(),
        ],
      ),
    );
  }
}
