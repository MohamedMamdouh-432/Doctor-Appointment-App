import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:testing_app/core/theming/colors.dart';
import 'package:testing_app/features/home/data/models/load_status.dart';
import 'package:testing_app/features/home/logic/cubit/home_cubit.dart';
import 'package:testing_app/features/home/ui/widgets/doctor_item.dart';
import 'package:velocity_x/velocity_x.dart';

class DoctorsList extends StatelessWidget {
  const DoctorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "Recommendation Doctor".text.size(18.sp).semiBold.make(),
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
            buildWhen: (p, c) => p != c && c.doctorsLoadStatus.isSuccess,
            builder: (context, state) => Expanded(
              child: Skeletonizer(
                enabled: state.doctorsLoadStatus.contain([
                  LoadStatus.initial,
                  LoadStatus.loading,
                ]),
                child: ListView.builder(
                  itemCount: state.doctors.length,
                  itemBuilder: (c, i) => DoctorItem(state.doctors[i]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
