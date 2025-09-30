import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:testing_app/core/theming/colors.dart';
import 'package:testing_app/core/widgets/generic_button.dart';
import 'package:testing_app/core/widgets/generic_text_field.dart';
import 'package:testing_app/features/signup/data/models/signup_request_body.dart';
import 'package:testing_app/features/signup/logic/cubit/signup_cubit.dart';
import 'package:testing_app/features/signup/ui/widgets/gender_selector.dart';
import 'package:testing_app/features/signup/ui/widgets/password_check_line.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  int? gender;
  String name = '',
      phone = '',
      email = '',
      password = '',
      confirmationPassword = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          GenericTextField(
            hint: 'Name',
            preIcon: Icons.person_rounded,
            onChanged: (v) => setState(() => name = v),
            validator: (v) {
              if (v!.isEmpty) return 'Name is required';
              return null;
            },
          ),
          Gap(10.h),
          IntlPhoneField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: ColorsManager.brighterGray,
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                gapPadding: 10.0,
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: ColorsManager.mainBlue,
                  width: 1.5,
                ),
              ),
              errorBorder: OutlineInputBorder(
                gapPadding: 10.0,
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: ColorsManager.brightRed,
                  width: 1.5,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                gapPadding: 10.0,
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: ColorsManager.brightRed,
                  width: 1.5,
                ),
              ),
              filled: true,
              fillColor: ColorsManager.brightestGray,
              hint: 'Phone'.text
                  .size(14.sp)
                  .color(ColorsManager.brightGray)
                  .make(),
            ),
            initialCountryCode: 'EG',
            onChanged: (v) {
              log(v.toString());
              setState(() => phone = v.countryCode + v.number);
            },
          ),
          Gap(10.h),
          GenderSelector(
            selectedGender: gender ?? -1,
            onChanged: (v) {
              log(v.toString());
              setState(() => gender = v);
            },
          ),
          Gap(10.h),
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
          Gap(10.h),
          GenericTextField(
            hint: 'Password',
            isObsecure: true,
            preIcon: Icons.lock_rounded,
            onChanged: (v) => setState(() => password = v),
          ),
          Gap(10.h),
          GenericTextField(
            hint: 'Confirmation Password',
            isObsecure: true,
            preIcon: Icons.lock_rounded,
            onChanged: (v) => setState(() => confirmationPassword = v),
            validator: (v) {
              if (password.isNotEmpty && v != password)
                return 'Passwords do not match';
              return null;
            },
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
            content: 'Sign Up',
            onPressed: () {
              if (!_formKey.currentState!.validate()) return;
              context.read<SignupCubit>().signup(
                SignupRequestBody(
                  name: name,
                  phone: phone,
                  gender: gender ?? 0,
                  email: email,
                  password: password,
                  confirmationPassword: confirmationPassword,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
