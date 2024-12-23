import 'package:currency_trading/logic/controllers/notifications_controller.dart';
import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/view/screens/notifications/widgets/notificationsInfo_list_widget.dart';
import 'package:currency_trading/view/widgets/drawer/drawer_widget.dart';
import 'package:currency_trading/view/widgets/mainLinear_gradient_function.dart';
import 'package:currency_trading/view/widgets/main_appbar_function.dart';
import 'package:currency_trading/view/widgets/main_circular_progress_widget.dart';
import 'package:currency_trading/view/widgets/main_name_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsScreen extends GetView<NotificationsControllerImpl> {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationsControllerImpl());
    return Scaffold(
        endDrawer: const DrawerWidget(),
        appBar: mainAppBar(
            'Notification',
            Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: InkWell(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.arrow_back, color: Colors.white)))),
        body: Container(
            width: double.infinity,
            height: double.maxFinite,
            decoration: mainLinearGradient(),
            child:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: GetBuilder<NotificationsControllerImpl>(
                  builder: (_) {
                    return controller.notificationsModel!=null? const  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomVerticalSizedox(height: 10),
                          MainNameContainerWidget(),
                          NotificationsInfoListWidget()
                        ]) : const MainCircularProgressWidget();
                  }
                ))));
  }
}
