import 'package:flutter/material.dart';
import 'package:order_food_app/config/theme/style/style_theme.dart';
import 'package:order_food_app/extension.dart';
import 'package:order_food_app/main.dart';
import 'package:order_food_app/widget/image_asset_custom.dart';

class ItemTextClickWidget extends StatelessWidget {
  const ItemTextClickWidget({
    required this.image,
    required this.text,
    required this.onTap,
    this.isToggle = false,
    this.toggle,
    super.key,
  });

  final String image;
  final String text;
  final VoidCallback onTap;
  final bool isToggle;
  final Widget? toggle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ImageAssetCustom(imagePath: image),
                SizedBox(width: 16),
                Text(text, style: StyleThemeData.styleSize14Weight500()),
              ],
            ),
            toggle ??
                Icon(Icons.arrow_forward_ios, color: appTheme.greyscale400Color)
          ],
        ),
      ),
    );
  }
}
