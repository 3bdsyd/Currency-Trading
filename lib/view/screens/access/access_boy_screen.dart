import 'package:currency_trading/logic/controllers/general_controller.dart';
import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:currency_trading/utils/images.dart';
import 'package:currency_trading/view/screens/access/widgets/access_boy_coupon_widget.dart';
import 'package:currency_trading/view/screens/access/widgets/access_boy_screen_shotBox_widget.dart';
import 'package:currency_trading/view/widgets/drawer/drawer_widget.dart';
import 'package:currency_trading/view/widgets/mainLinear_gradient_function.dart';
import 'package:currency_trading/view/widgets/main_appbar_function.dart';
import 'package:currency_trading/view/widgets/main_circular_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

class AccessBoyScreen extends GetView<GeneralControllerImpl> {
  const AccessBoyScreen({super.key, required this.isBasic});
  final bool isBasic;
  @override
  Widget build(BuildContext context) {
    Get.put(GeneralControllerImpl());
    return PopScope(
      onPopInvoked: (k) {
        controller.couponController.clear();
         FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          endDrawer: const DrawerWidget(),
          appBar: mainAppBar(
              'Access',
              Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: InkWell(
                      onTap: () {
                        Get.back();
                        controller.couponController.clear();
                        FocusScope.of(context).unfocus();
                      },
                      child:
                          const Icon(Icons.arrow_back, color: Colors.white)))),
          body: GetBuilder<GeneralControllerImpl>(
              builder: (_) => Container(
                  height: double.maxFinite,
                  decoration: mainLinearGradient(),
                  child: controller.subscriptionPackageModel != null
                      ? SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              const CustomVerticalSizedox(height: 10),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18.0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Hassan Mhd',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 19,
                                                fontWeight: FontWeight.w700)),
                                        isBasic
                                            ? Image.asset(ImagesAssets.payImage)
                                            : Image.asset(
                                                ImagesAssets.googlePayImage)
                                      ])),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18.0),
                                  child: Text('Not Subscribe',
                                      style: const TextStyle(
                                          color: Color(0xffADA9A9),
                                          fontWeight: FontWeight.w300,
                                          fontSize: 17))),
                              const CustomVerticalSizedox(height: 14),
                              isBasic
                                  ? Image.asset(ImagesAssets.basicImage)
                                  : Image.asset(ImagesAssets.ultimateImage),
                              const CustomVerticalSizedox(height: 26),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Enter Your Coupon ',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15)),
                                        const CustomVerticalSizedox(height: 10),
                                        StreamBuilder(
                                          stream: controller
                                              .couponStreamController.stream,
                                          builder: (context, snapshot) =>
                                              TextFormField(
                                            controller:
                                                controller.couponController,
                                            onChanged: (value) {
                                              controller.subscriptionPackage(
                                                  value: value);
                                            },
                                            decoration: InputDecoration(
                                                suffix: controller
                                                        .couponController
                                                        .text
                                                        .isEmpty
                                                    ? null
                                                    : controller.subscriptionPackageModel!
                                                                .type ==
                                                            'coupon'
                                                        ? Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    right:
                                                                        18.0),
                                                            child: SvgPicture.asset(
                                                                IconsAssets
                                                                    .rightIcon,
                                                                    fit: BoxFit.scaleDown,
                                                                color: const Color(
                                                                    0xff13AB25)),
                                                          )
                                                        : Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    right:
                                                                        18.0),
                                                            child: SvgPicture
                                                                .asset(IconsAssets
                                                                    .cancleIcon, fit: BoxFit.scaleDown,),
                                                          ),
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 14.0),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7),
                                                    borderSide:
                                                        BorderSide.none),
                                                filled: true,
                                                fillColor:
                                                    const Color(0xff282828)
                                                        .withOpacity(.4),
                                                prefixIcon: SvgPicture.asset(
                                                    IconsAssets.couponIcon, fit: BoxFit.scaleDown,),
                                                labelStyle: const TextStyle(
                                                    color: Colors.white)),
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                        const CustomVerticalSizedox(height: 20),
                                        AccessBoyCouponWidget(isBasic: isBasic),
                                        const CustomVerticalSizedox(height: 20),
                                        AccessBoyScreenShotBoxWidget(
                                            isBasic: isBasic),
                                        const CustomVerticalSizedox(height: 20)
                                      ]))
                            ]))
                      : MainCircularProgressWidget(
                          color: isBasic
                              ? const Color(0xff34A9FF)
                              : const Color(0xffF2B80C))))),
    );
  }
}