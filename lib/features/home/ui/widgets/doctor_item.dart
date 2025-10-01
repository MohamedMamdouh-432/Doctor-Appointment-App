import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class DoctorItem extends StatelessWidget {
  final Map<String, dynamic> doctor;

  const DoctorItem(this.doctor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100.sp,
            height: 100.sp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.sp),
              image: DecorationImage(
                image: AssetImage(doctor['imgUrl']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Gap(16.w),
          
        ],
      ),
    );
  }
}
