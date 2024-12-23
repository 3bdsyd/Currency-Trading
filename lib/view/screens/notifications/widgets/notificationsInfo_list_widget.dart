import 'package:currency_trading/logic/controllers/notifications_controller.dart';
import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:currency_trading/view/widgets/main_circular_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsInfoListWidget extends StatelessWidget {
  const NotificationsInfoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationsControllerImpl());

    // Add listener to detect when reaching max scroll
    controller.scrollController.addListener(() {
      if (controller.scrollController.position.pixels >=
          controller.scrollController.position.maxScrollExtent) {
        // Call function to load more notifications
        controller.notifications();
      }
    });

    return GetBuilder<NotificationsControllerImpl>(
        builder: (controller) =>  Expanded(
            child: ListView.separated(
                controller: controller.scrollController,
                itemBuilder: (context, index) {
                  // Check if this is the last item and if loading more
                  if (index == controller.notificationItems.length &&
                      controller.isLoadingMore) {
                    return const Center(
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: MainCircularProgressWidget()));
                  }

                  // Render normal notification items
                  return SizedBox(
                      child: ListTile(
                          title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(controller.notificationItems[index].title,
                                    style: const TextStyle(
                                        color: Color(0xffF7F7F7),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13)),
                                Text(
                                    controller
                                        .notificationItems[index].createdAt
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 10, color: Color(0xffF7F7F7)))
                              ]),
                          subtitle: Text(
                              controller.notificationItems[index].txt,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 11,
                                  color: Color(0xffF7F7F7))),
                          leading: Image.asset(IconsAssets.notificationIcon,
                              width: 30)));
                },
                separatorBuilder: (context, index) =>
                    const CustomVerticalSizedox(height: 13),
                itemCount: controller.isLoadingMore
                    ? controller.notificationItems.length + 1
                    : controller.notificationItems.length)));
  }
}
