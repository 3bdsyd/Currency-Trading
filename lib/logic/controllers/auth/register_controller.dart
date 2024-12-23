import 'package:currency_trading/model/auth/chech_email.dart';
import 'package:currency_trading/model/auth/send_code_model.dart';
import 'package:currency_trading/repo/auth/check_email_repo.dart';
import 'package:currency_trading/repo/auth/send_code_repo.dart';
import 'package:currency_trading/shared/custom_dialog.dart';
import 'package:currency_trading/shared/custom_loading.dart';
import 'package:currency_trading/view/screens/auth/verify/verify_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class RegisterController extends GetxController {
  Future<void> registerUser();
  void checked(bool value);
}

class RegisterControllerImpl extends RegisterController {
  final CheckEmailRepositoryImpl _chechEmailRepository =
      CheckEmailRepositoryImpl();
  final SendCodeRepositoryImpl _sendCodeRepository = SendCodeRepositoryImpl();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  final TextEditingController inviteCodeController = TextEditingController();
  bool isChecked = false;

  @override
  Future<void> registerUser() async {
    try {
      if (!formKey.currentState!.validate()) return;
      Get.closeAllSnackbars();

      showLoadingDialog();

      final resultCheckEmail = await _chechEmailRepository.checkEmail(
        email: emailController.text.trim(),
      );
      if (resultCheckEmail is CheckEmailModel) {
        if (resultCheckEmail.found == 1) {
          Get.back();
          showTextDialog('Email is already exists', true);
        } else {
          final resultSendCode = await _sendCodeRepository.sendCode(
            email: emailController.text.trim(),
          );
          if (resultSendCode is SendCodeModel) {
            Get.back();

            Get.off(() => const VerifyScreen(), arguments: {
              'code': resultSendCode.data.verificationCode.toString(),
              'email': emailController.text.trim(),
              'password': passwordController.text.trim(),
              'name': nameController.text.trim(),
              'intiveCode': inviteCodeController.text.toString(),
            });
          } else {
            Get.back();
          }
        }
      } else {
        Get.back();
      }
    } catch (_) {}
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

  @override
  void checked(bool value) {
    isChecked = value;
    update();
  }
}
