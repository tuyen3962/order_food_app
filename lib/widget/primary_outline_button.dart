import 'package:flutter/material.dart';
import 'package:order_food_app/extension.dart';
import 'package:order_food_app/main.dart';

class PrimaryOutlineButton extends StatelessWidget {
  const PrimaryOutlineButton({
    super.key,
    this.text = '',
    this.onTap,
    this.fontSize,
    this.textColor,
    this.buttonPadding,
    this.isFullWidth = true,
    this.backgroundColor,
    this.weight,
    this.isActive = false,
    this.contentStyle,
    this.icon,
  });

  final String text;
  final VoidCallback? onTap;
  final TextStyle? contentStyle;
  final double? fontSize;
  final Color? textColor;
  final FontWeight? weight;
  final EdgeInsets? buttonPadding;
  final Color? backgroundColor;
  final Widget? icon;
  final bool isFullWidth;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive ? null : onTap,
      child: Container(
        width: isFullWidth ? double.infinity : null,
        padding: buttonPadding,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor ?? appTheme.background,
          border: Border.all(
              color: isActive
                  ? appTheme.fadeBackgroundColor
                  : appTheme.primaryColor),
          borderRadius: BorderRadius.circular(1000),
        ),
        child: icon != null
            ? Row(
                mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon ?? const SizedBox(),
                  Text(
                    text,
                    style: contentStyle ??
                        TextStyle(
                          fontSize: fontSize ?? 14.fontSize,
                          color: textColor ??
                              (isActive
                                  ? appTheme.primaryTextColor
                                  : appTheme.fadeTextColor),
                          fontWeight: weight ?? FontWeight.w700,
                        ),
                  ),
                ],
              )
            : Text(
                text,
                style: TextStyle(
                  fontSize: fontSize ?? 14.fontSize,
                  color: textColor ??
                      (isActive
                          ? appTheme.primaryTextColor
                          : appTheme.fadeTextColor),
                  fontWeight: weight ?? FontWeight.w700,
                ),
              ),
      ),
    );
  }
}
