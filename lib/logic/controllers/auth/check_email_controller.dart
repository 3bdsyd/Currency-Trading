import 'package:currency_trading/core/helper/failures_handling.dart';
import 'package:currency_trading/core/services/app_services.dart';
import 'package:currency_trading/model/auth/chech_email.dart';
import 'package:currency_trading/model/auth/register_model.dart';
import 'package:currency_trading/repo/auth/check_email_repo.dart';
import 'package:currency_trading/repo/auth/register_repo.dart';
import 'package:currency_trading/shared/custom_dialog.dart';
import 'package:currency_trading/shared/custom_loading.dart';
import 'package:currency_trading/utils/constants/app_key.dart';
import 'package:currency_trading/view/screens/root/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class RegisterController extends GetxController {
  Future<void> checkEmail();
}

class RegisterControllerImpl extends RegisterController {
  final _box = Get.find<MyServices>().getBox;
  final CheckEmailRepositoryImpl _repository = CheckEmailRepositoryImpl();
  final RegisterRepositoryImpl _registerRepo = RegisterRepositoryImpl();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  final TextEditingController inviteCodeController = TextEditingController();

  @override
  Future<void> checkEmail() async {
    try {
      if (!formKey.currentState!.validate()) return;
      showLoadingDialog();

      final result = await _repository.checkEmail(
        email: emailController.text.trim(),
      );
      Get.back();
      if (result is CheckEmailModel) {
        if (result.found == 1) {
          Get.snackbar('Error', 'Email is already exists');
        } else {
          final result = await _registerRepo.registerUser(
            name: nameController.text.trim(),
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
            inviteCode: inviteCodeController.text.trim(),
          );
          Get.back();
          if (result is RegisterModel) {
            _storeUserData(result);
            Get.off(() => const RootScreen());
          } else if (result is Failures) {
            if (result.data is Map<String, dynamic>) {
              showTextDialog(
                result.data.entries.first.value.first,
                true,
              );
            }
          }
        }
      }
    } catch (_) {}
  }

  void _storeUserData(RegisterModel registeredUser) {
    _box.write(AppKey.name, registeredUser.data.name);
    _box.write(AppKey.email, registeredUser.data.email);
    // _box.write(AppKey.token, registeredUser.token);
  }

  bool isPasswordVisible = false;

  /// Toggles the visibility of the password field.
  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  bool isPasswordConfirmationVisible = false;

  /// Toggles the visibility of the password confirmation field.
  void togglePasswordConfirmationVisibility() {
    isPasswordConfirmationVisible = !isPasswordConfirmationVisible;
    update();
  }
}
