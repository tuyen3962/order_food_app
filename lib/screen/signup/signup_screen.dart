import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:order_food_app/base/stream/base_stream_builder.dart';
import 'package:order_food_app/base/widget/base_page.dart';
import 'package:order_food_app/config/theme/style/style_theme.dart';
import 'package:order_food_app/extension.dart';
import 'package:order_food_app/main.dart';
import 'package:order_food_app/router/app_route_constant.dart';
import 'package:order_food_app/screen/signup/signup_controller.dart';
import 'package:order_food_app/utils/assets/images_asset.dart';
import 'package:order_food_app/widget/edit_text_field_custom.dart';
import 'package:order_food_app/widget/image_asset_custom.dart';
import 'package:order_food_app/widget/primary_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => SignUpScreenState();
}

class SignUpScreenState extends BasePageState<SignUpScreen, SignUpController> {
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
              child: Text('Sign Up',
                  style: StyleThemeData.bold30(color: appTheme.whiteText)),
            ),
          ),
          Positioned(
            top: 180.h,
            left: 0,
            right: 0,
            child: Center(
              child: Text('Please sign up to get started',
                  style: StyleThemeData.regular16(color: appTheme.whiteText)),
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
      padding: padding(all: 24),
      decoration: BoxDecoration(
          color: appTheme.whiteText,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      child: ListView(
        children: [
          EditTextFieldCustom(
            label: 'Name',
            textFieldNode: controller.nameController,
            hintText: 'John doe',
          ),
          SizedBox(height: 24.h),
          EditTextFieldCustom(
            label: 'Email',
            textFieldNode: controller.emailController,
            hintText: 'example@gmail.com',
          ),
          SizedBox(height: 24.h),
          BaseStreamBuilder(
            controller: controller.obscurePassword,
            builder: (value) => EditTextFieldCustom(
              label: 'Password',
              textFieldNode: controller.passwordController,
              hintText: '******',
              obscure: value,
              suffix: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: controller.onChangeObscurePassword,
                    child: ImageAssetCustom(
                        imagePath:
                            value ? ImagesAssets.eye_on : ImagesAssets.eye_off,
                        size: 19),
                  ),
                  SizedBox(width: 20.w)
                ],
              ),
            ),
          ),
          SizedBox(height: 24.h),
          BaseStreamBuilder(
            controller: controller.obscureConfirmPass,
            builder: (value) => EditTextFieldCustom(
              label: 'Confirm Passowrd',
              textFieldNode: controller.confirmPasswordController,
              hintText: '******',
              obscure: value,
              suffix: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: controller.onChangeObscureConfirmPassword,
                    child: ImageAssetCustom(
                        imagePath:
                            value ? ImagesAssets.eye_on : ImagesAssets.eye_off,
                        size: 19),
                  ),
                  SizedBox(width: 20.w)
                ],
              ),
            ),
          ),
          SizedBox(height: 24.h),
          TwoBaseStreamBuilder(
            firstController: controller.isFormValid,
            secondController: controller.isLoading,
            builder: (isValid, isLoading) => PrimaryButton(
              text: 'Sign Up',
              isLoading: isLoading,
              borderRadius: 12,
              isActive: isValid,
              buttonPadding: padding(vertical: 22),
            ),
          ),
        ],
      ),
    );
  }

  @override
  SignUpController initController() => SignUpController(this);
}
