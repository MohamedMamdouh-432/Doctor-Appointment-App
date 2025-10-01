import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testing_app/features/home/ui/components/doctor_speciality_series.dart';
import 'package:testing_app/features/home/ui/components/doctors_list.dart';
import 'package:testing_app/features/home/ui/components/home_top_bar.dart';
import 'package:testing_app/features/home/ui/components/nearby_doctor_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(20.sp, 16.sp, 20.sp, 30.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeTopBar(),
              NearbyDoctorCard(),
              DoctorSpecialitySeries(),
              Gap(10.sp),
              DoctorsList(),
            ],
          ),
        ),
      ),
    );
  }
}
