import 'package:currency_trading/logic/controllers/general_controller.dart';
import 'package:currency_trading/view/screens/access/access_info_pay_screen.dart';
import 'package:currency_trading/view/screens/access/widgets/access_months_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccessBoyCouponWidget extends StatelessWidget {
  const AccessBoyCouponWidget({super.key, required this.isBasic});
  final bool isBasic;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralControllerImpl>(
        builder: (controller) => InkWell(
            onTap: () => Get.to(() =>  AccessInfoPayScreen(isBasic: isBasic),
                transition: Transition.fadeIn,
                duration: const Duration(milliseconds: 800)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AccessMonthsWidget(
                      isBasic: isBasic,
                      numberMonth: 1,
                      value: isBasic &&
                              controller.subscriptionPackageModel!.type ==
                                  'stander'
                          ? controller.subscriptionPackageModel!.standerBasic1
                          : isBasic
                              ? controller.subscriptionPackageModel!.basic1
                              : !isBasic &&
                                      controller
                                              .subscriptionPackageModel!.type ==
                                          'stander'
                                  ? controller.subscriptionPackageModel!
                                      .standerUltimate1
                                  : !isBasic
                                      ? controller
                                          .subscriptionPackageModel!.ultimate1
                                      : ''),
                  const SizedBox(width: 8),
                  AccessMonthsWidget(
                      isBasic: isBasic,
                      numberMonth: 3,
                      value: isBasic &&
                              controller.subscriptionPackageModel!.type ==
                                  'stander'
                          ? controller.subscriptionPackageModel!.standerBasic3
                          : isBasic
                              ? controller.subscriptionPackageModel!.basic3
                              : !isBasic &&
                                      controller
                                              .subscriptionPackageModel!.type ==
                                          'stander'
                                  ? controller.subscriptionPackageModel!
                                      .standerUltimate3
                                  : !isBasic
                                      ? controller
                                          .subscriptionPackageModel!.ultimate3
                                      : ''),
                  const SizedBox(width: 8),
                  AccessMonthsWidget(
                      isBasic: isBasic,
                      numberMonth: 6,
                      value: isBasic &&
                              controller.subscriptionPackageModel!.type ==
                                  'stander'
                          ? controller.subscriptionPackageModel!.standerBasic6
                          : isBasic
                              ? controller.subscriptionPackageModel!.basic6
                              : !isBasic &&
                                      controller
                                              .subscriptionPackageModel!.type ==
                                          'stander'
                                  ? controller.subscriptionPackageModel!
                                      .standerBasic6
                                  : !isBasic
                                      ? controller
                                          .subscriptionPackageModel!.ultimate6
                                      : '')
                ])));
  }
}
