import 'package:flutter/material.dart';
import 'package:order_food_app/base/widget/base_page.dart';
import 'package:order_food_app/config/theme/style/style_theme.dart';
import 'package:order_food_app/extension.dart';
import 'package:order_food_app/main.dart';
import 'package:order_food_app/screen/login/login_controller.dart';
import 'package:order_food_app/utils/assets/images_asset.dart';
import 'package:order_food_app/widget/image_asset_custom.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends BasePageState<LoginScreen, LoginController> {
  @override
  Widget buildAppbar() => SizedBox();

  @override
  bool? get isTopSafeArea => false;

  @override
  Widget buildBody() {
    return ColoredBox(
      color: appTheme.backgroundBlackColor,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: ImageAssetCustom(
                imagePath: ImagesAssets.topAppbarLogin, size: 177),
          ),
          Positioned(
            top: 138.h,
            left: 0,
            right: 0,
            child: Center(
              child: Text('Log In',
                  style: StyleThemeData.styleSize30Weight700(
                      color: appTheme.whiteText)),
            ),
          ),
          Positioned(
            top: 180.h,
            left: 0,
            right: 0,
            child: Center(
              child: Text('Please sign in to your existing account',
                  style: StyleThemeData.styleSize16Weight400(
                      color: appTheme.whiteText)),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 233.h,
            child: _buildBottomView(),
          )
        ],
      ),
    );
  }

  Widget _buildBottomView() {
    return Container(
      decoration: BoxDecoration(
          color: appTheme.whiteText,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
    );
  }

  @override
  LoginController initController() => LoginController(this);
}
