import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testing_app/core/theming/colors.dart';
import 'package:testing_app/core/widgets/generic_button.dart';
import 'package:testing_app/core/widgets/generic_text_field.dart';
import 'package:testing_app/features/login/ui/components/footer_section.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          GenericTextField(hint: 'Email', preIcon: Icons.email_rounded),
          Gap(20.h),
          GenericTextField(
            hint: 'Password',
            isObsecure: true,
            preIcon: Icons.lock_rounded,
            sufIcon: Icons.remove_red_eye_rounded,
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: TextButton(
              onPressed: () {},
              child: 'Forgot Password?'.text
                  .color(ColorsManager.mainBlue)
                  .make(),
            ),
          ),
          Gap(30.h),
          GenericButton(content: 'Login', onPressed: () => {}),
          Gap(50.h),
          FooterSection(),
        ],
      ),
    );
  }
}
