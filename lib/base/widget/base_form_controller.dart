import 'package:flutter/material.dart';
import 'package:order_food_app/base/stream/base_stream_controller.dart';
import 'package:order_food_app/base/widget/base_controller.dart';
import 'package:order_food_app/widget/textfield/text_field_node.dart';

abstract class BaseFormController<T extends State<StatefulWidget>>
    extends BaseController<T> {
  BaseFormController(super.state);

  List<TextFieldNode> get textFieldNodes;
  final isFormValid = BaseStreamController(false);
  bool get isValid;

  @override
  void onReady() {
    super.onReady();
    for (final node in textFieldNodes) {
      if (node.onUnfocusListener == null) {
        node.onSetUnfocusListener(onCheckForm);
      }
    }
  }

  void onCheckForm() {
    isFormValid.value = isValid;
  }

  @override
  void dispose() {
    isFormValid.dispose();
    for (final node in textFieldNodes) {
      node.dispose();
    }
    super.dispose();
  }
}
