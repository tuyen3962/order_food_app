import 'package:flutter/material.dart';
import 'package:order_food_app/extension.dart';

class TextFieldCustom extends StatefulWidget {
  const TextFieldCustom(
      {super.key,
      this.hintStyle,
      this.hintText,
      this.obscureText = false,
      required this.controller,
      this.suffix,
      this.border,
      this.onFieldSubmitted,
      this.cursorColor,
      this.textInputAction,
      this.focusNode,
      this.contentPadding,
      this.maxLine,
      this.counterStyle,
      this.maxLength,
      this.filledColor,
      this.canEdit = true,
      this.textInputType,
      this.onTap});
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? counterStyle;
  final bool obscureText;
  final TextEditingController controller;
  final Widget? suffix;
  final Color? filledColor;
  final OutlineInputBorder? border;
  final Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final Color? cursorColor;
  final FocusNode? focusNode;
  final EdgeInsets? contentPadding;
  final int? maxLine;
  final int? maxLength;
  final VoidCallback? onTap;
  final bool canEdit;
  final TextInputType? textInputType;
  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      onFieldSubmitted: widget.onFieldSubmitted,
      obscureText: widget.obscureText,
      textInputAction: widget.textInputAction,
      cursorColor: widget.cursorColor,
      maxLines: widget.obscureText ? 1 : widget.maxLine,
      maxLength: widget.maxLength,
      onTap: widget.onTap,
      readOnly: !widget.canEdit,
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
          contentPadding:
              widget.contentPadding ?? padding(vertical: 1, horizontal: 12),
          filled: widget.filledColor != null,
          fillColor: widget.filledColor,
          hintText: widget.hintText,
          hintStyle: widget.hintStyle,
          enabledBorder: widget.border,
          focusedBorder: widget.border,
          counterStyle: widget.counterStyle,
          suffixIcon: widget.suffix),
    );
  }
}
