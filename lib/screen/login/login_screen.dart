import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:order_food_app/base/stream/base_stream_builder.dart';
import 'package:order_food_app/base/widget/base_page.dart';
import 'package:order_food_app/config/theme/style/style_theme.dart';
import 'package:order_food_app/extension.dart';
import 'package:order_food_app/main.dart';
import 'package:order_food_app/screen/login/login_controller.dart';
import 'package:order_food_app/utils/assets/images_asset.dart';
import 'package:order_food_app/widget/edit_text_field_custom.dart';
import 'package:order_food_app/widget/image_asset_custom.dart';
import 'package:order_food_app/widget/primary_button.dart';

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
                  style: StyleThemeData.bold30(color: appTheme.whiteText)),
            ),
          ),
          Positioned(
            top: 180.h,
            left: 0,
            right: 0,
            child: Center(
              child: Text('Please sign in to your existing account',
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
            label: 'Email',
            textFieldNode: controller.emailController,
            hintText: 'example@gmail.com',
          ),
          SizedBox(height: 24.h),
          BaseStreamBuilder(
            controller: controller.isObscurePassword,
            builder: (value) => EditTextFieldCustom(
              label: 'Password',
              textFieldNode: controller.passwordCtrl,
              hintText: '******',
              obscure: value,
              suffix: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: controller.onChangeObscure,
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
          Row(
            children: [
              Checkbox(
                value: true,
                visualDensity: VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onChanged: (val) {},
                activeColor: appTheme.primaryColor,
                side: BorderSide(color: appTheme.borderCheckColor, width: 2),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
              ),
              SizedBox(width: 10.w),
              Text('Remember me',
                  style: StyleThemeData.regular12(
                      color: appTheme.rememberTextColor)),
              Spacer(),
              Text(
                'Forgot Password',
                style: StyleThemeData.regular14(color: appTheme.primaryColor),
              )
            ],
          ),
          SizedBox(height: 30.h),
          BaseStreamBuilder(
            controller: controller.isFormValid,
            builder: (isValid) => PrimaryButton(
              text: 'Log in',
              borderRadius: 12,
              isActive: isValid,
              onTap: controller.onLogin,
              buttonPadding: padding(vertical: 22),
            ),
          ),
          SizedBox(height: 38.h),
          Center(
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Don't have an account? ",
                  style:
                      StyleThemeData.regular16(color: appTheme.greyTextColor)),
              TextSpan(
                  text: 'Sign Up',
                  style: StyleThemeData.bold14(color: appTheme.primaryColor)),
            ])),
          ),
          SizedBox(height: 27.h),
          Center(
            child: Text('Or',
                style: StyleThemeData.regular16(color: appTheme.greyTextColor)),
          ),
        ],
      ),
    );
  }

  @override
  LoginController initController() => LoginController(this);
}
