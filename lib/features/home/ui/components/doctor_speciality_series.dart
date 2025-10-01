import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testing_app/core/helpers/dummy.dart';
import 'package:testing_app/core/theming/colors.dart';
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
        SizedBox(
          height: 100.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: specialities.length,
            itemBuilder: (c, i) => DoctorSpecialtyItem(specialities[i]),
          ),
        ),
      ],
    );
  }
}
