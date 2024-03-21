import 'package:flutter/material.dart';
import 'package:order_food_app/extension.dart';

class TextFieldNode {
  final textCtrl = TextEditingController();
  final node = FocusNode();
  final errorValidate = ValueNotifier(false);
  final emptyError = ValueNotifier(false);
  final String? errorText;
  final String? emptyText;
  final String initializeText;
  late VoidCallback? onUnfocusListener = null;

  bool get isError => errorValidate.value;

  bool get isEmptyError => emptyError.value;

  String get text => textCtrl.text;

  bool get isEmpty => textCtrl.text.isEmpty;

  set isError(bool value) {
    errorValidate.value = value;
  }

  set text(String value) {
    textCtrl.text = value;
  }

  TextFieldNode({
    bool Function(String value)? validateFieldError,
    this.errorText,
    VoidCallback? onListernText,
    this.initializeText = '',
    this.emptyText = '',
    bool isRequired = false,
  }) {
    textCtrl.text = initializeText;
    node.unfocusListener(() {
      if (validateFieldError != null) {
        errorValidate.value = validateFieldError(textCtrl.text);
      }
      onUnfocusListener?.call();
      if (isRequired) {
        emptyError.value = textCtrl.text.isEmpty;
      }
    });
    if (onListernText != null || isRequired) {
      textCtrl.addListener(() {
        if (onListernText != null) {
          onListernText();
        }
      });
    }
  }

  void onSetUnfocusListener(VoidCallback action) {
    onUnfocusListener = action;
  }

  void dispose() {
    emptyError.dispose();
    textCtrl.dispose();
    node.dispose();
    errorValidate.dispose();
  }
}
