import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:order_food_app/base/widget/base_controller.dart';
import 'package:order_food_app/config/service/account_service.dart';
import 'package:order_food_app/config/service/app_service.dart';
import 'package:order_food_app/router/app_route_constant.dart';
import 'package:order_food_app/screen/splash/splash_screen.dart';

class SplashController extends BaseController<SplashScreenState> {
  late final AccountService accountService = locator.get();
  final isScale = ValueNotifier<bool>(false);

  SplashController(super.state) {
    Future.delayed(const Duration(milliseconds: 100))
        .then((value) => isScale.value = true);
    initService();
  }

  initService() async {
    await Future.delayed(const Duration(seconds: 1))
        .then((value) => goToOnboardingPage());
  }

  goToOnboardingPage() {
    context.go(RouteName.ONBOARDING);
    // if (accountService.isLogin()) {
    //   context.go(RouteName.EMPLOYEE);
    // } else {
    //   context.go(RouteName.SIGNIN);
    // }
  }

  @override
  List<ValueNotifier> get notifiers => [isScale];
}
