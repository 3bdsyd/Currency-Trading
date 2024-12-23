import 'package:currency_trading/core/helper/failures_handling.dart';
import 'package:currency_trading/core/services/app_services.dart';
import 'package:currency_trading/model/auth/logout_model.dart';
import 'package:currency_trading/repo/auth/logout_repo.dart';
import 'package:currency_trading/shared/custom_dialog.dart';
import 'package:currency_trading/shared/custom_loading.dart';
import 'package:currency_trading/view/screens/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LogoutController extends GetxController {
  Future<void> logout();
}

class LogoutControllerImpl extends LogoutController {
  final _box = Get.find<MyServices>().getBox;
  final LogoutRepositoryImpl _repo = LogoutRepositoryImpl();
  @override
  Future<void> logout() async {
    try {
      Get.dialog(
        AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          surfaceTintColor: const Color(0xff263775),
          backgroundColor: Colors.white,
          contentPadding: EdgeInsets.zero,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 25, left: 16, right: 16),
                child: Text(
                  'Are You Sure Logout?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextButton(
                    style: ButtonStyle(
                      padding: const WidgetStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 3),
                      ),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                          side: const BorderSide(
                            color: Color(0xff263775),
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      Get.back();
                      showLoadingDialog();
                      final result = await _repo.logout();
                      Get.back();
                      if (result is LogOutModel) {
                        Get.deleteAll();
                        _clearUserData();
                        Get.off(() => const LoginScreen());
                      } else if (result is Failures) {
                        showTextDialog(
                          result.errMessage,
                          true,
                        );
                      }
                    },
                    child: Text(
                      'ok'.tr,
                      style: const TextStyle(fontSize: 19, color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextButton(
                    style: ButtonStyle(
                      padding: const WidgetStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 3),
                      ),
                      backgroundColor:
                          WidgetStateProperty.all(const Color(0xff263775)),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      'cancel'.tr,
                      style: const TextStyle(color: Colors.white, fontSize: 19),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    } catch (_) {}
  }

  void _clearUserData() {
    _box.erase();
  }
}
