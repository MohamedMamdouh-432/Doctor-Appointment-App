import 'package:flutter/material.dart';
import 'package:testing_app/core/theming/colors.dart';

class TextStyles {
  static final font24Wight700Black = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static final font32BoldBlue = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: ColorsManager.mainBlue,
  );

  static final font14NormalGray = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );

  static final font16Weight600White = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
