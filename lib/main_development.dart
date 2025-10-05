import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testing_app/core/di/dependency_injection.dart';
import 'package:testing_app/core/helpers/functions.dart';
import 'package:testing_app/firebase_options.dart';
import 'package:testing_app/launcher.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarContrastEnforced: true,
      systemStatusBarContrastEnforced: true,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await setupDI();
  await checkUserStatus();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Launcher());
}
