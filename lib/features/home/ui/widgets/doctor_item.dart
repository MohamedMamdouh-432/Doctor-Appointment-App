import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testing_app/core/theming/colors.dart';
import 'package:testing_app/features/home/data/models/doctors_response.dart';
import 'package:velocity_x/velocity_x.dart';

class DoctorItem extends StatelessWidget {
  final Doctor doctor;

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
            width: 90.w,
            height: 110.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.sp),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.sp),
              child: CachedNetworkImage(
                imageUrl: doctor.photo!,
                fit: BoxFit.fill,
                errorWidget: (c, e, st) => CachedNetworkImage(
                  imageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSGeQOMZh98o1ciCTDmWwSJ0NehuW6_qGGBQ&s",
                ),
              ),
            ),
          ),
          Column(
            spacing: 8.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              doctor.name!.text.size(14.sp).bold.make(),
              SizedBox(
                width: 200.w,
                child: "${doctor.specialization!.name}  |  ${doctor.phone}".text
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
                  doctor.degree!.text
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
