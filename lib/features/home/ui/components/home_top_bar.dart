import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testing_app/core/theming/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Hi, Mohamed!".text.size(18.sp).bold.make(),
            "How are you today?".text
                .size(11.sp)
                .color(ColorsManager.gray)
                .make(),
          ],
        ),
        Spacer(),
        CircleAvatar(
          radius: 20.sp,
          backgroundColor: ColorsManager.brighterGray,
          child: SvgPicture.asset(
            'assets/svgs/notifications.svg',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
