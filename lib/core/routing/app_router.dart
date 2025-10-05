import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:testing_app/core/di/dependency_injection.dart';
import 'package:testing_app/core/helpers/constants.dart';
import 'package:testing_app/core/helpers/functions.dart';
import 'package:testing_app/core/routing/routes.dart';
import 'package:testing_app/features/home/logic/cubit/home_cubit.dart';
import 'package:testing_app/features/home/ui/screens/home_screen.dart';
import 'package:testing_app/features/login/logic/cubit/login_cubit.dart';
import 'package:testing_app/features/login/ui/screens/login_screen.dart';
import 'package:testing_app/features/onboarding/ui/screens/onboarding_screen.dart';
import 'package:testing_app/features/signup/logic/cubit/signup_cubit.dart';
import 'package:testing_app/features/signup/ui/screens/signup_screen.dart';

var loginRouteBuilder = BlocProvider(
  create: (context) => LoginCubit(getIt()),
  child: const LoginScreen(),
);

var homeRouteBuilder = BlocProvider(
  create: (context) => HomeCubit(getIt())
    ..fetchAllSpecialities()
    ..fetchAllDoctors(),
  child: HomeScreen(),
);

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: Routes.startScreen,
      builder: (c, s) {
        switch (userStatus) {
          case Constants.notLoggingIn:
            return loginRouteBuilder;
          case Constants.loggingIn:
            return homeRouteBuilder;
          default:
            return OnboardingScreen();
        }
      },
    ),
    GoRoute(path: Routes.loginScreen, builder: (c, s) => loginRouteBuilder),
    GoRoute(
      path: Routes.signupScreen,
      builder: (c, s) => BlocProvider(
        create: (context) => SignupCubit(getIt()),
        child: SignupScreen(),
      ),
    ),
    GoRoute(path: Routes.homeScreen, builder: (c, s) => homeRouteBuilder),
  ],
);
