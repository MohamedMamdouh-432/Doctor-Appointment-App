import 'package:flutter/material.dart';
import 'package:testing_app/core/theming/colors.dart';
import 'package:testing_app/core/theming/text_styles.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.mainBlue,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text('Get Started', style: TextStyles.font16Weight600White),
    );
  }
}
