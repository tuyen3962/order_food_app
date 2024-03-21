import 'package:order_food_app/base/stream/base_stream_controller.dart';
import 'package:order_food_app/base/widget/base_controller.dart';
import 'package:order_food_app/base/widget/base_form_controller.dart';
import 'package:order_food_app/screen/login/login_screen.dart';
import 'package:order_food_app/utils/util.dart';
import 'package:order_food_app/widget/textfield/text_field_node.dart';

class LoginController extends BaseFormController<LoginScreenState> {
  late final emailController =
      TextFieldNode(isRequired: true, validateFieldError: Utils.isEmail);
  final passwordCtrl = TextFieldNode(isRequired: true);
  final isObscurePassword = BaseStreamController<bool>(true);

  LoginController(super.state);

  @override
  void dispose() {
    isObscurePassword.dispose();
    super.dispose();
  }

  void onChangeObscure() {
    isObscurePassword.value = !isObscurePassword.value;
  }

  @override
  bool get isValid {
    if (emailController.isEmpty &&
        passwordCtrl.isEmpty &&
        emailController.errorValidate.value &&
        passwordCtrl.errorValidate.value) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> onLogin() async {
    print(isFormValid.value);
  }

  @override
  List<TextFieldNode> get textFieldNodes => [emailController, passwordCtrl];
}
