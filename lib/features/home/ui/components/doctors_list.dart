import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testing_app/core/helpers/dummy.dart';
import 'package:testing_app/core/theming/colors.dart';
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
          Expanded(
            child: ListView.builder(
              itemCount: doctors.length,
              itemBuilder: (c, i) => DoctorItem(doctors[i]),
            ),
          ),
        ],
      ),
    );
  }
}
