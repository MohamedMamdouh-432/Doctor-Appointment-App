import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testing_app/core/theming/colors.dart';
import 'package:testing_app/features/home/data/models/specializations_response.dart';
import 'package:testing_app/features/home/logic/cubit/home_cubit.dart';
import 'package:velocity_x/velocity_x.dart';

class DoctorSpecialtyItem extends StatelessWidget {
  final Specialization doctorSpecialty;

  const DoctorSpecialtyItem(this.doctorSpecialty, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          context.read<HomeCubit>().filterDoctorsBySpeciality(doctorSpecialty),
      child: SizedBox(
        width: 100.sp,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 30.sp,
              backgroundColor: ColorsManager.brighterGray,
              child: Image.asset(
                "assets/images/brain.png",
                fit: BoxFit.contain,
                width: 40.sp,
              ),
            ),
            doctorSpecialty.name!.text.size(14.sp).ellipsis.make(),
          ],
        ),
      ),
    );
  }
}
