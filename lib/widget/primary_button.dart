import 'package:flutter/material.dart';
import 'package:order_food_app/extension.dart';
import 'package:order_food_app/main.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.text = '',
    this.onTap,
    this.fontSize,
    this.textColor,
    this.buttonPadding,
    this.isFullWidth = true,
    this.backgroundColor,
    this.weight,
    this.isActive = true,
    this.icon,
    this.borderRadius = 1000,
  });

  final String text;
  final VoidCallback? onTap;
  final double? fontSize;
  final Color? textColor;
  final FontWeight? weight;
  final EdgeInsets? buttonPadding;
  final Color? backgroundColor;
  final Widget? icon;
  final bool isFullWidth;
  final bool isActive;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive ? onTap : null,
      child: Container(
        width: isFullWidth ? double.infinity : null,
        padding: buttonPadding,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: !isActive
              ? backgroundColor ?? appTheme.fadeBackgroundColor
              : backgroundColor ?? appTheme.primaryColor,
          border: Border.all(
              color: !isActive
                  ? appTheme.fadeBackgroundColor
                  : appTheme.primaryColor),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: icon != null
            ? Row(
                mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon ?? const SizedBox(),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: fontSize ?? 14.fontSize,
                      color:
                          textColor ?? themeUtil.getAppTheme().primaryTextColor,
                      fontWeight: weight ?? FontWeight.w700,
                    ),
                  ),
                ],
              )
            : Text(
                text,
                style: TextStyle(
                  fontSize: fontSize ?? 14.fontSize,
                  color: textColor ?? themeUtil.getAppTheme().primaryTextColor,
                  fontWeight: weight ?? FontWeight.w700,
                ),
              ),
      ),
    );
  }
}
