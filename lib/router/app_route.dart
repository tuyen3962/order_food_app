import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:order_food_app/main.dart';
import 'package:order_food_app/router/app_route_constant.dart';
import 'package:order_food_app/screen/login/login_screen.dart';
import 'package:order_food_app/screen/onboarding/onboarding_screen.dart';
import 'package:order_food_app/screen/preview_image/preview_image_page.dart';
import 'package:order_food_app/screen/preview_image/preview_image_parameter.dart';
import 'package:order_food_app/screen/signup/signup_screen.dart';

import 'package:order_food_app/screen/splash/splash_screen.dart';

class AppRoute {
  static final mainRouter = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: RouteName.SPLASH,
    routes: <RouteBase>[
      // StatefulShellRoute.indexedStack(
      //   builder: (context, state, navigationShell) {
      //     return HomePage(navigationShell: navigationShell);
      //   },
      //   branches: [
      //     StatefulShellBranch(routes: [
      //       GoRoute(
      //           path: RouteName.EMPLOYEE,
      //           builder: (context, state) => const EmployeeScreen())
      //     ]),
      //     StatefulShellBranch(routes: [
      //       GoRoute(
      //           path: RouteName.HEART_MEASURE,
      //           builder: (context, state) => const HeartScreen())
      //     ])
      //   ],
      // ),
      GoRoute(
        path: RouteName.SPLASH,
        builder: (BuildContext context, GoRouterState state) =>
            const SplashScreen(),
      ),
      GoRoute(
        path: RouteName.SIGNIN,
        builder: (BuildContext context, GoRouterState state) =>
            const LoginScreen(),
      ),
      GoRoute(
        path: RouteName.ONBOARDING,
        builder: (BuildContext context, GoRouterState state) =>
            const OnboardingScreen(),
      ),
      GoRoute(
        path: RouteName.PREVIEW_IMAGE,
        builder: (context, state) {
          return PreviewImagePage(
              parameter: state.extra as PreviewImageParameter);
        },
      ),
      GoRoute(
        path: RouteName.SIGN_UP,
        builder: (context, state) => SignUpScreen(),
      ),
    ],
  );
}
