import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing_app/launcher.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Color(0xFFFFFFFF),
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(const Launcher());
}
