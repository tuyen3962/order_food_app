import 'package:flutter/material.dart';
import 'package:order_food_app/base/widget/base_page.dart';
import 'package:order_food_app/screen/temp/_controller.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => ScreenState();
}

class ScreenState extends BasePageState<Screen, Controller> {
  @override
  Controller initController() => Controller(this);
}
