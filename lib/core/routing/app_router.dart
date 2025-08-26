import 'package:go_router/go_router.dart';
import 'package:testing_app/core/routing/routes.dart';
import 'package:testing_app/features/login/ui/screens/login_screen.dart';
import 'package:testing_app/features/onboarding/ui/screens/onboarding_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: Routes.onBoardingScreen,
      builder: (context, state) => OnboardingScreen(),
    ),
    GoRoute(
      path: Routes.loginScreen,
      builder: (context, state) => const LoginScreen(),
    ),
  ],
);
