import 'package:currency_trading/model/notifications_model.dart';
import 'package:currency_trading/repo/notifications_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class NotificationsController extends GetxController {
  Future<void> notifications();
}

class NotificationsControllerImpl extends NotificationsController {
  final NotificationsRepositoryImpl _repository = NotificationsRepositoryImpl();
  NotificationsModel? notificationsModel;
  List<NotificationData> notificationItems = [];
  final ScrollController scrollController = ScrollController();

  int page = 1;
  bool isLoadingMore = false;
  bool hasMoreNotifi = true;
  @override
  void onInit() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print('>>>>>>>>>>>>> max');
        final controller = Get.find<NotificationsControllerImpl>();
        if (!controller.hasMoreNotifi) {
          controller.notifications();
        }
      }
    });
    super.onInit();
    notifications();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  @override
  Future<void> notifications() async {
    print('================');
    if (!hasMoreNotifi) {
      return;
    }
    if (notificationItems.isNotEmpty) {
      isLoadingMore = true;
    }
    update();
    final result = await _repository.fetchNotifications(page);
    if (result is NotificationsModel) {
      notificationsModel = result;
      notificationItems.addAll(result.data);
      if (notificationItems.length < notificationsModel!.meta.total) {
        page += 1;
      } else {
        hasMoreNotifi = false;
      }
      print('======================succcus notifications');
      // print('-------------------------- ${notificationsModel.length}');
    }
    // else {
    //   await notifications();
    // }
    update();
  }
}
