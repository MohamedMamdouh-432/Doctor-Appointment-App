import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:testing_app/core/routing/routes.dart';
import 'package:testing_app/features/login/logic/cubit/login_cubit.dart';
import 'package:testing_app/features/login/logic/cubit/login_state.dart';
import 'package:testing_app/features/login/ui/components/footer_section.dart';
import 'package:testing_app/features/login/ui/components/headline_section.dart';
import 'package:testing_app/features/login/ui/components/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<LoginCubit, LoginState>(
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
                  title: 'Login Success',
                  desc: 'Welcome Back!',
                  btnOkText: 'Ok',
                ).show();
                Future.delayed(
                  const Duration(seconds: 2),
                  () => context.go(Routes.homeScreen),
                );
              },
              error: (message) {
                context.pop();
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  title: 'Login Error',
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
                LoginForm(),
                Gap(50.h),
                FooterSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
