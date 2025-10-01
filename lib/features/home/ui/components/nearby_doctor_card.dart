import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testing_app/core/theming/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class NearbyDoctorCard extends StatelessWidget {
  const NearbyDoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: 170.h,
          padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 16.sp),
          margin: EdgeInsets.symmetric(vertical: 35.sp),
          decoration: BoxDecoration(
            color: ColorsManager.mainBlue,
            borderRadius: BorderRadius.circular(24.sp),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 140.w,
                child: "Book and schedule with nearest doctor".text
                    .size(18.sp)
                    .medium
                    .color(Colors.white)
                    .make(),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: "Find Nearby".text
                    .size(12.sp)
                    .color(ColorsManager.mainBlue)
                    .make(),
              ),
            ],
          ),
        ),
        Positioned(
          right: 15.sp,
          top: 0,
          bottom: 35.sp,
          child: Container(
            width: 140.sp,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/female_doctor.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
