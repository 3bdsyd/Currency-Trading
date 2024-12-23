import 'package:currency_trading/logic/controllers/general_controller.dart';
import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:currency_trading/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class AccessBoyScreenShotBoxWidget extends StatelessWidget {
  const AccessBoyScreenShotBoxWidget({
    super.key,
    required this.isBasic,
  });
  final bool isBasic;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralControllerImpl>(
      builder: (controller) => Stack(children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 60),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(colors: [
                
                  isBasic ? const Color(0xff34A9FF) : const Color(0xffF2B80C),
                  isBasic ? const Color(0xff383F76) : const Color(0xffaa8b45),
                ])),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('NETWORK',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w700)),
              Text(
                  controller.gneralModel != null
                      ? controller.gneralModel!.data.basic.network
                      : '',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w700)),
              const CustomVerticalSizedox(height: 15),
              Row(children: [
                isBasic
                    ? SvgPicture.asset(IconsAssets.basicCopyIcon,
                        width: 31, height: 27)
                    : SvgPicture.asset(IconsAssets.ultimateCopyIcon,
                        width: 31, height: 27),
                const SizedBox(width: 7),
                Text(
                    controller.gneralModel != null
                        ? controller.gneralModel!.data.basic.wallet
                        : '',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700))
              ]),
              const CustomVerticalSizedox(height: 27),
              const Text('Attach The Screenshot',
                  style: TextStyle(color: Colors.white, fontSize: 14)),
              const CustomVerticalSizedox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor:isBasic? const Color(0xff282828).withOpacity(.4): Colors.white.withOpacity(.3),
                    prefixIcon: Image.asset(
                      IconsAssets.vectorIcon,
                      color: isBasic ? Colors.white : const Color(0xff383F76),
                    ),
                    labelStyle: const TextStyle(color: Colors.white)),
                style: const TextStyle(color: Colors.white),
              ),
              const CustomVerticalSizedox(height: 25),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(23),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white.withOpacity(.1)),
                  child: const Text(
                      'Send a screenshot of the payment  to get access right away.',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                      textAlign: TextAlign.center)),
              const CustomVerticalSizedox(height: 25),
              Center(
                  child: InkWell(
                onTap: () {
                  try {
                    canLaunchUrl(
                        Uri.parse(controller.gneralModel!.data.telegram));
                    print(
                        '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> TELEGRAM');
                  } catch (e) {
                    print('>>>>>>>>>>>> $e');
                  }
                },
                child: Container(
                    width: 162,
                    decoration: BoxDecoration(
                        color: isBasic
                            ? const Color(0xff263775)
                            : const Color(0xffF2B80C),
                        borderRadius: BorderRadius.circular(8)),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(IconsAssets.sendIcon),
                          const SizedBox(width: 8),
                          const Text('Send',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20))
                        ])),
              ))
            ])),
        Positioned(right: 1, child: Image.asset(ImagesAssets.decorationImage))
      ]),
    );
  }
}
