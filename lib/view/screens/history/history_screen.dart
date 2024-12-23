import 'package:currency_trading/logic/controllers/history_controller.dart';
import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/view/screens/history/widgets/history_main_list_widget.dart';
import 'package:currency_trading/view/widgets/drawer/drawer_widget.dart';
import 'package:currency_trading/view/widgets/mainLinear_gradient_function.dart';
import 'package:currency_trading/view/widgets/main_appbar_function.dart';
import 'package:currency_trading/view/widgets/main_name_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HistoryControllerImpl());
    return Scaffold(
        endDrawer: const DrawerWidget(),
        appBar: mainAppBar(
            '',
            Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: InkWell(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.arrow_back, color: Colors.white)))),
        body: Container(
            width: double.infinity,
            height: double.maxFinite,
            decoration: mainLinearGradient(),
            child: const SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomVerticalSizedox(height: 10),
                          MainNameContainerWidget(),
                          HistoryMainListWidget(),
                          CustomVerticalSizedox(height: 20),
                        ])))));
  }
}
