import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SignalDetailsCopyDialogWidget extends StatelessWidget {
  const SignalDetailsCopyDialogWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.number,
  });

  final String icon;
  final String title;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: const Color(0xff23252F),
            borderRadius: BorderRadius.circular(16)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(icon),
              const CustomVerticalSizedox(height: 6),
              Text(
                title,
                style: TextStyle(
                    color: title == 'STOP'
                        ? const Color(0XFFFF0004)
                        : title == 'ENTRY'
                            ? const Color(0xff3D992B)
                            : Colors.white),
              ),
              const CustomVerticalSizedox(height: 6),
              Text(
                number,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              const CustomVerticalSizedox(height: 6),
              InkWell(
                 onTap: () {
                    Clipboard.setData(ClipboardData(text: number));
                    Get.snackbar('Copied!', number,
                        backgroundColor: const Color(0xffF2B80C),
                        colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
                  },
                child: Image.asset(IconsAssets.copyDialogIcon))
            ]));
  }
}
