import 'package:order_food_app/base/widget/base_controller.dart';
import 'package:order_food_app/screen/preview_image/preview_image_page.dart';
import 'package:order_food_app/screen/preview_image/preview_image_parameter.dart';

class PreviewImageController extends BaseController<PreviewImagePageState> {
  final PreviewImageParameter parameter;

  PreviewImageController(super.state, {required this.parameter});
}
