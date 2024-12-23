import 'package:currency_trading/core/helper/failures_handling.dart';
import 'package:currency_trading/core/services/app_services.dart';
import 'package:currency_trading/model/auth/login_model.dart';
import 'package:currency_trading/repo/auth/login_repo.dart';
import 'package:currency_trading/shared/custom_dialog.dart';
import 'package:currency_trading/shared/custom_loading.dart';
import 'package:currency_trading/utils/constants/app_key.dart';
import 'package:currency_trading/view/screens/root/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  Future<void> loginUser();
  void togglePasswordVisibility();
}

class LoginControllerImpl extends LoginController {
  final _box = Get.find<MyServices>().getBox;
  final LoginRepositoryImpl _repository = LoginRepositoryImpl();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Future<void> loginUser() async {
    if (!formKey.currentState!.validate()) return;
    showLoadingDialog();
    final result = await _repository.loginUser(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    Get.back();
    if (result is LoginModel) {
      _storeUserData(result);

      await Get.off(() => const RootScreen());
    } else if (result is Failures) {
      showTextDialog(
        result.errMessage,
        true,
      );
    }
  }

  void _storeUserData(LoginModel registeredUser) {
    _box.write(AppKey.email, registeredUser.data.email);
    _box.write(AppKey.token, registeredUser.data.token);
    _box.write(AppKey.name, registeredUser.data.name);
    _box.write(AppKey.id, registeredUser.data.id);
    _box.write(AppKey.type, registeredUser.data.type);
    _box.write(AppKey.country, registeredUser.data.country);
    _box.write(AppKey.inviteCode, registeredUser.data.inviteCode);
    _box.write(AppKey.birthday, registeredUser.data.birthday);
    _box.write(AppKey.inviteLink, registeredUser.data.inviteLink);
    _box.write(AppKey.money, registeredUser.data.money);
    _box.write(AppKey.wallet, registeredUser.data.wallet);
  }

  bool isPasswordVisible = false;

  @override
  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }
}
