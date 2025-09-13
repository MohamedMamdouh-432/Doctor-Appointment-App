import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:velocity_x/velocity_x.dart';

class GenderSelector extends StatelessWidget {
  final int selectedGender;
  final void Function(int) onChanged;

  const GenderSelector({
    super.key,
    required this.onChanged,
    required this.selectedGender,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        'Select Gender'.text.size(16.sp).make(),
        const Spacer(),
        Radio<int>(
          value: 0,
          groupValue: selectedGender,
          onChanged: (v) => onChanged.call(v!),
        ),
        const Text('Male'),
        Gap(10.w),
        Radio<int>(
          value: 1,
          groupValue: selectedGender,
          onChanged: (v) => onChanged.call(v!),
        ),
        const Text('Female'),
      ],
    );
  }
}
