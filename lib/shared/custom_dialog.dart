import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showTextDialog(String message, bool isError, [Function()? onTap]) {
  Get.dialog(
    AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      surfaceTintColor: const Color(0xff263775),
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.close)),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25, left: 16, right: 16),
            child: Text(message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
          style: ButtonStyle(
            padding: const WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 30, vertical: 3)),
            backgroundColor: const WidgetStatePropertyAll(Color(0xff263775)),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          onPressed: () => Get.back(),
          child: Text('ok'.tr,
              style: const TextStyle(color: Colors.white, fontSize: 19)),
        ),
      ],
    ),
    barrierDismissible: false,
  );
}
