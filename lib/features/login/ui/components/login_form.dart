import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:testing_app/core/theming/colors.dart';
import 'package:testing_app/core/widgets/generic_button.dart';
import 'package:testing_app/core/widgets/generic_text_field.dart';
import 'package:testing_app/features/login/data/models/login_request_body.dart';
import 'package:testing_app/features/login/logic/cubit/login_cubit.dart';
import 'package:testing_app/features/login/ui/widgets/password_check_line.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String email = '', password = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          GenericTextField(
            hint: 'Email',
            preIcon: Icons.email_rounded,
            onChanged: (v) => setState(() => email = v),
            validator: (v) {
              RegExp regExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!regExp.hasMatch(v!)) return 'Invalid email';
              return null;
            },
          ),
          Gap(20.h),
          GenericTextField(
            hint: 'Password',
            isObsecure: true,
            preIcon: Icons.lock_rounded,
            onChanged: (v) => setState(() => password = v),
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
          // password rules rows
          PasswordCheckLine('At least 8 characters', password.length >= 8),
          PasswordCheckLine(
            'At least one uppercase letter',
            password.contains(RegExp(r'[A-Z]')),
          ),
          PasswordCheckLine(
            'At least one lowercase letter',
            password.contains(RegExp(r'[a-z]')),
          ),
          PasswordCheckLine(
            'At least one number',
            password.contains(RegExp(r'[0-9]')),
          ),
          PasswordCheckLine(
            'At least one special character',
            password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')),
          ),
          Gap(50.h),
          GenericButton(
            content: 'Login',
            onPressed: () => context.read<LoginCubit>().login(
              LoginRequestBody(email: email, password: password),
            ),
          ),
        ],
      ),
    );
  }
}
