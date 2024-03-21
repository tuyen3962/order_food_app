import 'package:flutter/cupertino.dart';
import 'package:order_food_app/base/stream/base_stream_controller.dart';

class BaseController<T extends State<StatefulWidget>> {
  late final List<BaseStreamController> streamCtrls = [];

  late final List<TextEditingController> textCtrls = [];

  late final List<ValueNotifier> notifiers = [];

  final T state;
  final BuildContext context;

  BaseController(this.state) : context = state.context {
    onInit();
    onReady();
  }

  void onInit() {}
  void onReady() {}

  void dispose() {
    for (final controller in streamCtrls) {
      controller.dispose();
    }
    for (final controller in textCtrls) {
      controller.dispose();
    }
    for (final controller in notifiers) {
      controller.dispose();
    }
  }
}
