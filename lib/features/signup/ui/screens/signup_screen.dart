import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:testing_app/core/routing/routes.dart';
import 'package:testing_app/features/signup/logic/cubit/signup_cubit.dart';
import 'package:testing_app/features/signup/logic/cubit/signup_state.dart';
import 'package:testing_app/features/signup/ui/components/footer_section.dart';
import 'package:testing_app/features/signup/ui/components/headline_section.dart';
import 'package:testing_app/features/signup/ui/components/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<SignupCubit, SignupState>(
          listenWhen: (p, c) => c is Loading || c is Success || c is Error,
          listener: (context, state) {
            state.whenOrNull(
              loading: () => showDialog(
                context: context,
                builder: (context) =>
                    SpinKitFadingCircle(size: 70, color: Colors.white),
              ),
              success: (data) {
                context.pop();
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.success,
                  title: 'Account Created Successfully',
                  desc: 'Login and Get Started!',
                  btnOkText: 'Ok',
                ).show();
                Future.delayed(
                  const Duration(seconds: 2),
                  () => context.go(Routes.loginScreen),
                );
              },
              error: (message) {
                context.pop();
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  title: 'Sign Up Error',
                  desc: message,
                  btnCancelText: 'Close',
                ).show();
              },
            );
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadlineSection(),
                Gap(40.h),
                SignupForm(),
                Gap(30.h),
                FooterSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
