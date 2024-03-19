import 'package:flutter/material.dart';
import 'package:order_food_app/base/widget/base_page.dart';
import 'package:order_food_app/extension.dart';
import 'package:order_food_app/main.dart';
import 'package:order_food_app/screen/splash/splash_controller.dart';
import 'package:order_food_app/config/theme/base_app_theme.dart';
import 'package:order_food_app/utils/assets/images_asset.dart';
import 'package:order_food_app/widget/image_asset_custom.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends BasePageState<SplashScreen, SplashController> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeUtil.themeType,
      builder: (context, val, child) => Scaffold(
        backgroundColor: appTheme.background,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: ImageAssetCustom(
                  imagePath: ImagesAssets.topSplash, size: 177),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: ImageAssetCustom(
                  imagePath: ImagesAssets.bottomSplash, size: 177),
            ),
            Center(
              child: ImageAssetCustom(
                  imagePath: ImagesAssets.logo, width: 121.13, height: 58.88),
            )
          ],
        ),
      ),
    );
  }

  @override
  SplashController initController() => SplashController(this);

  @override
  Widget buildBody() => const SizedBox();
}
