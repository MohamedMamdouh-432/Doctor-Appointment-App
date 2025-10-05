import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:testing_app/core/theming/colors.dart';
import 'package:testing_app/features/home/data/models/load_status.dart';
import 'package:testing_app/features/home/logic/cubit/home_cubit.dart';
import 'package:testing_app/features/home/ui/widgets/doctor_specialty_item.dart';
import 'package:velocity_x/velocity_x.dart';

class DoctorSpecialitySeries extends StatelessWidget {
  const DoctorSpecialitySeries({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            "Doctor Speciality".text.size(18.sp).semiBold.make(),
            TextButton(
              onPressed: () {},
              child: "See All".text
                  .size(14.sp)
                  .color(ColorsManager.mainBlue)
                  .make(),
            ),
          ],
        ),
        BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (p, c) => p != c && c.specializationsLoadStatus.isSuccess,
          builder: (context, state) => SizedBox(
            height: 90.h,
            child: Skeletonizer(
              enabled: state.specializationsLoadStatus.contain([
                LoadStatus.initial,
                LoadStatus.loading,
              ]),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.specializationsResponse.specializaties?.length ?? 0,
                itemBuilder: (c, i) => DoctorSpecialtyItem(
                  state.specializationsResponse.specializaties![i],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
