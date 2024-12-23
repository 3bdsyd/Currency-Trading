import 'package:currency_trading/view/widgets/main_circular_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showLoadingDialog() {
  Get.dialog(
      barrierDismissible: false,
      const PopScope(
        canPop: false,
        child: Center(
          child: MainCircularProgressWidget(),
        ),
      ));
}
