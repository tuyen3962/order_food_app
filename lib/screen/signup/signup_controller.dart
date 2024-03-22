import 'package:order_food_app/base/stream/base_stream_controller.dart';
import 'package:order_food_app/base/widget/base_form_controller.dart';
import 'package:order_food_app/config/repository/account/iaccount_repository.dart';
import 'package:order_food_app/config/service/app_service.dart';
import 'package:order_food_app/screen/signup/signup_screen.dart';
import 'package:order_food_app/utils/util.dart';
import 'package:order_food_app/widget/textfield/text_field_node.dart';

class SignUpController extends BaseFormController<SignUpScreenState> {
  late final IAccountRepository accountRepository = locator.get();

  SignUpController(super.state);

  final nameController = TextFieldNode(isRequired: true);
  final emailController = TextFieldNode(
      isRequired: true, validateFieldError: (value) => Utils.isEmail(value));
  final passwordController = TextFieldNode(isRequired: true);
  late final confirmPasswordController = TextFieldNode(
      isRequired: true,
      validateFieldError: (value) => value != passwordController.text);

  final obscurePassword = BaseStreamController(true);
  final obscureConfirmPass = BaseStreamController(true);
  final isLoading = BaseStreamController(false);

  @override
  bool get isValid {
    if (nameController.isEmpty ||
        emailController.isEmpty ||
        passwordController.isEmpty ||
        confirmPasswordController.isEmpty ||
        !Utils.isEmail(emailController.text) ||
        passwordController.text != confirmPasswordController.text) {
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    obscureConfirmPass.dispose();
    obscurePassword.dispose();
    isLoading.dispose();
    super.dispose();
  }

  @override
  List<TextFieldNode> get textFieldNodes => [
        nameController,
        emailController,
        passwordController,
        confirmPasswordController
      ];

  void onChangeObscurePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  void onChangeObscureConfirmPassword() {
    obscureConfirmPass.value = !obscureConfirmPass.value;
  }

  Future<void> onSignUp() async {}
}
