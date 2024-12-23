import 'package:currency_trading/core/helper/failures_handling.dart';
import 'package:currency_trading/core/services/app_services.dart';
import 'package:currency_trading/model/auth/register_model.dart';
import 'package:currency_trading/model/auth/send_code_model.dart';
import 'package:currency_trading/repo/auth/register_repo.dart';
import 'package:currency_trading/repo/auth/send_code_repo.dart';
import 'package:currency_trading/shared/custom_dialog.dart';
import 'package:currency_trading/shared/custom_loading.dart';
import 'package:currency_trading/utils/constants/app_key.dart';
import 'package:currency_trading/view/screens/root/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SendCodeController extends GetxController {
  Future<void> sendCode();
  Future<void> verifyCode(String code);
}

class SendCodeControllerImpl extends SendCodeController {
  final SendCodeRepositoryImpl _repository = SendCodeRepositoryImpl();
  String codeFromResponse = Get.arguments['code'];
  String email = Get.arguments['email'];
  String password = Get.arguments['password'];
  String name = Get.arguments['name'];
  String? inviteCode = Get.arguments['inviteCode'];
  

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  final _box = Get.find<MyServices>().getBox;
  final RegisterRepositoryImpl _repositoryRegister = RegisterRepositoryImpl();
  @override
  Future<void> sendCode() async {
    try {
      showLoadingDialog();
      final result = await _repository.sendCode(
        email: email,
      );

      Get.back();
      if (result is SendCodeModel) {
        codeFromResponse = result.data.verificationCode.toString();
      } else if (result is Failures) {
        showTextDialog(
          result.data.entries.first.value.first,
          true,
        );
      }
    } catch (_) {}
  }

  @override
  Future<void> verifyCode(String code) async {
    if (codeFromResponse == code) {
        final resultRegidter = await _repositoryRegister.registerUser(
        name: name,
        email: email,
        password: password,
        inviteCode: inviteCode.toString(),
      );
      print('222222222222222222222222');
      if (resultRegidter is RegisterModel) {
        _storeUserData(resultRegidter);
        Get.off(() => const RootScreen());

        print('333333333333333333333333333333');
      } else {
        Get.back();
      }
    } else {
      Get.snackbar('Error', 'Code is not correct!', backgroundColor: Colors.red);
    }
  }


    /// Stores user data after successful registration.
  void _storeUserData(RegisterModel registeredUser) {
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
}
