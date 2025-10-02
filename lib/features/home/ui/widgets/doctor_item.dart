import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testing_app/core/theming/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class DoctorItem extends StatelessWidget {
  final Map<String, dynamic> doctor;

  const DoctorItem(this.doctor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.sp),
      child: Row(
        spacing: 16.w,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 110.w,
            height: 120.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.sp),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.sp),
              child: Image.network(doctor['imgUrl'], fit: BoxFit.fill),
            ),
          ),
          Column(
            spacing: 8.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (doctor['name'] as String).text.size(16.sp).bold.make(),
              SizedBox(
                width: 190.w,
                child: "${doctor['speciality']}  |  ${doctor['workplace']}".text
                    .size(12.sp)
                    .medium
                    .color(ColorsManager.gray)
                    .ellipsis
                    .make(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 5.w,
                children: [
                  Icon(
                    Icons.star_rate,
                    color: ColorsManager.mainYellow,
                    size: 18.sp,
                  ),
                  doctor['rating']
                      .toString()
                      .text
                      .size(14.sp)
                      .medium
                      .color(ColorsManager.gray)
                      .make(),
                  "(${doctor['reviews']} reviews)".text
                      .size(14.sp)
                      .medium
                      .color(ColorsManager.gray)
                      .make(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
