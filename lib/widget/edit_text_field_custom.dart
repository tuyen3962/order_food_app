import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:order_food_app/config/theme/style/style_theme.dart';
import 'package:order_food_app/extension.dart';
import 'package:order_food_app/main.dart';
import 'package:order_food_app/utils/assets/images_asset.dart';
import 'package:order_food_app/widget/image_asset_custom.dart';
import 'package:order_food_app/widget/text_field_custom.dart';
import 'package:order_food_app/widget/textfield/text_field_node.dart';

class EditTextFieldCustom extends StatelessWidget {
  const EditTextFieldCustom(
      {super.key,
      required this.label,
      required this.textFieldNode,
      this.items = const [],
      this.mapItems = const {},
      this.isDropDown = false,
      this.onTap,
      this.labelStyle,
      this.canEdit = true,
      this.onItemSelected,
      this.textInputType,
      this.obscure = false,
      this.suffix,
      this.hintText = ''});

  final String label;
  final TextFieldNode textFieldNode;
  final String hintText;
  final List<String> items;

  /// this item use for display value but return key
  final Map<String, String> mapItems;
  final bool isDropDown;
  final VoidCallback? onTap;
  final TextStyle? labelStyle;
  final bool canEdit;
  final void Function(String item)? onItemSelected;
  final TextInputType? textInputType;
  final bool obscure;
  final Widget? suffix;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: labelStyle ?? StyleThemeData.bold12()),
        SizedBox(height: 4.h),
        TextFieldCustom(
          controller: textFieldNode.textCtrl,
          filledColor: appTheme.backgrounTextField,
          focusNode: textFieldNode.node,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: appTheme.backgrounTextField),
              borderRadius: BorderRadius.circular(10)),
          hintStyle: StyleThemeData.regular14(color: appTheme.hintTextField),
          contentPadding: padding(vertical: 16, horizontal: 12),
          hintText: hintText,
          onTap: onTap,
          canEdit: canEdit,
          textInputType: textInputType,
          obscureText: obscure,
          suffix: isDropDown && items.isEmpty
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [_buildIcon(), SizedBox(width: 16.w)],
                )
              : suffix,
        ),
        ValueListenableBuilder(
          valueListenable: textFieldNode.errorValidate,
          builder: (context, error, child) => ValueListenableBuilder(
            valueListenable: textFieldNode.emptyError,
            builder: (context, empty, child) {
              return Visibility(
                  visible: error || empty,
                  child: Text(
                      empty
                          ? textFieldNode.emptyText ?? ''
                          : textFieldNode.errorText ?? '',
                      style: StyleThemeData.regular14()
                          .copyWith(color: appTheme.warningColor)));
            },
          ),
        )
      ],
    );
  }

  Widget _buildIcon() {
    return Padding(
      padding: padding(right: 16),
      child: Transform.rotate(
        angle: -pi / 2,
        child: ImageAssetCustom(
          imagePath: ImagesAssets.close,
          height: 18.w,
          width: 24.w,
        ),
      ),
    );
  }
}
