import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:order_food_app/base/stream/base_stream_controller.dart';
import 'package:order_food_app/base/widget/base_controller.dart';
import 'package:order_food_app/config/view_model/onboarding_view_model.dart';
import 'package:order_food_app/router/app_route_constant.dart';
import 'package:order_food_app/screen/onboarding/onboarding_screen.dart';
import 'package:order_food_app/utils/assets/images_asset.dart';

class OnboardingController extends BaseController<OnboardingScreenState> {
  OnboardingController(super.state);
  final pageController = PageController();
  final currentIndex = BaseStreamController(0);

  List<OnboardingViewModel> get viewModel => [
        OnboardingViewModel(
            imagePath: ImagesAssets.onboarding,
            content:
                'Get all your loved foods in one once place, you just place the orer we do the rest',
            title: 'All your favorites'),
        OnboardingViewModel(
            imagePath: ImagesAssets.onboarding,
            content:
                'Get all your loved foods in one once place, you just place the orer we do the rest',
            title: 'All your favorites'),
        OnboardingViewModel(
            imagePath: ImagesAssets.onboarding,
            content:
                'Get all your loved foods in one once place, you just place the orer we do the rest',
            title: 'Order from choosen chef'),
        OnboardingViewModel(
            imagePath: ImagesAssets.onboarding,
            content:
                'Get all your loved foods in one once place, you just place the orer we do the rest',
            title: 'Free delivery offers'),
      ];

  scrollToNextPage() {
    if (currentIndex.value != viewModel.length - 1) {
      currentIndex.value += 1;
      pageController.animateToPage(currentIndex.value,
          duration: const Duration(milliseconds: 200), curve: Curves.linear);
    } else {
      context.go(RouteName.SIGNIN);
    }
  }

  scrollToLastPage() {
    if (currentIndex.value != viewModel.length - 1) {
      currentIndex.value = viewModel.length - 1;
      pageController.animateToPage(currentIndex.value,
          duration: const Duration(milliseconds: 200), curve: Curves.linear);
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    currentIndex.dispose();
    super.dispose();
  }
}
