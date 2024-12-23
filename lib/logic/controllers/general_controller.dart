import 'dart:async';

import 'package:currency_trading/model/general_model.dart';
import 'package:currency_trading/model/subscription_package_model.dart';
import 'package:currency_trading/repo/general_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class GeneralController extends GetxController {
  Future<void> generalData();
  Future<void> subscriptionPackage({String? value});
}

class GeneralControllerImpl extends GeneralController {
  final GeneralRepositoryImpl _repository = GeneralRepositoryImpl();
  GeneralModel? gneralModel;
  final StreamController couponStreamController = StreamController.broadcast();
  TextEditingController couponController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    generalData();
    subscriptionPackage();
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      couponStreamController.add(timer.tick);
    });
  }

  @override
  void dispose() {
    couponStreamController.close();
    couponController.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    couponStreamController.close();
       couponController.dispose();
    super.onClose();
  }

  @override
  Future<void> generalData() async {
    final result = await _repository.fetchGeneralData();
    if (result is GeneralModel) {
      gneralModel = result;
      print('====================== succcus access');
    } else {
      await generalData();
    }
    update();
  }

// ============ Subscription Package ==============

  SubscriptionPackageModel? subscriptionPackageModel;

  @override
  Future<void> subscriptionPackage({String? value}) async {
    final result = await _repository.subscriptionPackage(value: value);
    if (result is SubscriptionPackageModel) {
      subscriptionPackageModel = result;
      print('====================== succcus subscription package');
    } else {
      await generalData();
    }
    update();
  }

  // @override
  // Future<void> openTelegram(String telegram) async {
  //   final String telegramUrl = telegram;
  //   final String telegramWebUrl = telegram;

  //   if (await canLaunchUrl(Uri.parse(telegramUrl))) {
  //     await launchUrl(Uri.parse(telegramUrl));
  //   } else {
  //     if (await canLaunchUrl(Uri.parse(telegramWebUrl))) {
  //       await launchUrl(Uri.parse(telegramWebUrl));
  //     } else {
  //       throw 'Could not launch Telegram';
  //     }
  //   }
  // }
}