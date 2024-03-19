import 'package:flutter/material.dart';
import 'package:order_food_app/base/stream/base_stream_builder.dart';
import 'package:order_food_app/base/widget/base_page.dart';
import 'package:order_food_app/config/theme/style/style_theme.dart';
import 'package:order_food_app/config/view_model/onboarding_view_model.dart';
import 'package:order_food_app/extension.dart';
import 'package:order_food_app/main.dart';
import 'package:order_food_app/screen/onboarding/onboarding_controller.dart';
import 'package:order_food_app/widget/image_asset_custom.dart';
import 'package:order_food_app/widget/primary_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => OnboardingScreenState();
}

class OnboardingScreenState
    extends BasePageState<OnboardingScreen, OnboardingController> {
  @override
  bool get showBack => false;

  @override
  Widget buildBody() {
    return Padding(
      padding: padding(horizontal: 26),
      child: Column(
        children: [
          Expanded(
              child: PageView.builder(
            controller: controller.pageController,
            itemCount: controller.viewModel.length,
            onPageChanged: (value) => controller.currentIndex.value = value,
            itemBuilder: (context, index) =>
                _buildPageItem(controller.viewModel[index]),
          )),
          SizedBox(height: 32.h),
          BaseStreamBuilder(
            controller: controller.currentIndex,
            builder: (value) => Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                    controller.viewModel.length,
                    (index) => Padding(
                          padding: padding(right: 8),
                          child: CircleAvatar(
                            radius: 8,
                            backgroundColor: value == index
                                ? appTheme.primaryColor
                                : appTheme.fadePrimaryColor,
                          ),
                        )),
              ),
            ),
          ),
          SizedBox(height: 69.h),
          BaseStreamBuilder(
            controller: controller.currentIndex,
            builder: (value) => PrimaryButton(
              text: value == controller.viewModel.length - 1 ? 'Done' : 'Next',
              onTap: controller.scrollToNextPage,
              buttonPadding: padding(vertical: 23),
            ),
          ),
          BaseStreamBuilder(
            controller: controller.currentIndex,
            builder: (value) => Opacity(
              opacity: value != controller.viewModel.length - 1 ? 1 : 0,
              child: GestureDetector(
                onTap: controller.scrollToLastPage,
                child: Padding(
                    padding: padding(top: 16),
                    child: Text('Skip',
                        style: StyleThemeData.styleSize16Weight400())),
              ),
            ),
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }

  Widget _buildPageItem(OnboardingViewModel viewModel) {
    return Column(
      children: [
        Expanded(
            child: Center(
          child: ImageAssetCustom(
              imagePath: viewModel.imagePath, width: 240, height: 292),
        )),
        SizedBox(height: 63.h),
        Text(viewModel.title, style: StyleThemeData.styleSize24Weight700()),
        SizedBox(height: 18.h),
        Text(viewModel.content, style: StyleThemeData.styleSize16Weight400())
      ],
    );
  }

  @override
  OnboardingController initController() => OnboardingController(this);
}
