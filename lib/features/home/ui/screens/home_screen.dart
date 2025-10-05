import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:testing_app/features/home/logic/cubit/home_cubit.dart';
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
        child: BlocListener<HomeCubit, HomeState>(
          listenWhen: (p, c) =>
              p != c &&
              (c.doctorsLoadStatus.isLoading ||
                  c.specializationsLoadStatus.isLoading ||
                  c.doctorsLoadStatus.isError ||
                  c.specializationsLoadStatus.isError),
          listener: (ctx, state) {
            if (state.specializationsLoadStatus.isError) {
              AwesomeDialog(
                context: ctx,
                dialogType: DialogType.error,
                title: 'Data Load Error',
                desc: state.specializationsResponse.message,
                btnCancelText: 'Close',
              ).show();
            } else if (state.doctorsLoadStatus.isError) {
              if (ctx.canPop()) ctx.pop();
              AwesomeDialog(
                context: ctx,
                dialogType: DialogType.error,
                title: 'Data Load Error',
                desc: state.doctorsResponse.message,
                btnCancelText: 'Close',
              ).show();
            }
          },
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(20.sp, 16.sp, 20.sp, 0.sp),
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
      ),
    );
  }
}
