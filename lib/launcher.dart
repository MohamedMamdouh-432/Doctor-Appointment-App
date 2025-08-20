import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testing_app/core/routing/app_router.dart';

class Launcher extends StatelessWidget {
  const Launcher({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      child: MaterialApp.router(
        routerConfig: appRouter,
      ),
    );
  }
}