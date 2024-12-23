import 'package:currency_trading/logic/controllers/general_controller.dart';
import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:currency_trading/utils/images.dart';
import 'package:currency_trading/view/widgets/drawer/drawer_widget.dart';
import 'package:currency_trading/view/widgets/mainLinear_gradient_function.dart';
import 'package:currency_trading/view/widgets/main_appbar_function.dart';
import 'package:currency_trading/view/widgets/main_name_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

String? selectedOption = "1 Month";

class AccessInfoPayScreen extends StatefulWidget {
  const AccessInfoPayScreen({
    super.key,
    required this.isBasic,
  });
  final bool isBasic;

  @override
  State<AccessInfoPayScreen> createState() => _AccessInfoPayScreenState();
}

class _AccessInfoPayScreenState extends State<AccessInfoPayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: const DrawerWidget(),
        appBar: mainAppBar(
            'Access',
            Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: InkWell(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.arrow_back, color: Colors.white)))),
        body: Container(
            height: double.maxFinite,
            decoration: mainLinearGradient(),
            child: SingleChildScrollView(
                child: GetBuilder<GeneralControllerImpl>(
              builder: (controller) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomVerticalSizedox(height: 10),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: MainNameContainerWidget(),
                    ),
                    const CustomVerticalSizedox(height: 20),
                    Image.asset(widget.isBasic
                        ? ImagesAssets.basicImage
                        : ImagesAssets.ultimateImage),
                    const CustomVerticalSizedox(height: 20),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Column(children: [
                          _buildOption(
                              "1 Month",
                              controller.gneralModel != null
                                  ? controller.gneralModel!.data.basic.oneMonth
                                  : ''),
                          const CustomVerticalSizedox(height: 13),
                          _buildOption(
                              "3 Month",
                              controller.gneralModel != null
                                  ? controller
                                      .gneralModel!.data.basic.threeMonth
                                  : ''),
                          const CustomVerticalSizedox(height: 13),
                          _buildOption(
                              "6 Month",
                              controller.gneralModel != null
                                  ? controller.gneralModel!.data.basic.sixMonth
                                  : '')
                        ])),
                    const CustomVerticalSizedox(height: 40),
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        margin: const EdgeInsets.symmetric(horizontal: 18),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: widget.isBasic
                                ? Colors.black
                                : const Color(0xff1A0DAB),
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(widget.isBasic
                            ? IconsAssets.basicPay
                            : IconsAssets.unlimatedPay))
                  ]),
            ))));
  }

  Widget _buildOption(String duration, String price) {
    return GestureDetector(
        onTap: () {
          setState(() {
            selectedOption = duration;
          });
        },
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
                color: const Color(0xFF2C2C2E),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: selectedOption == duration
                        ? Colors.white.withOpacity(.3)
                        : Colors.transparent,
                    width: 1.5)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Radio<String>(
                        value: duration,
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value;
                          });
                        },
                        activeColor: Colors.white),
                    Text(duration,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))
                  ]),
                  Text('${price.toString()} USD',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))
                ])));
  }
}
