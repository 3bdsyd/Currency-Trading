import 'package:currency_trading/logic/controllers/general_controller.dart';
import 'package:currency_trading/view/screens/access/access_boy_screen.dart';
import 'package:currency_trading/view/screens/access/widgets/access_boy_container_widget.dart';
import 'package:currency_trading/view/screens/access/widgets/access_card_widget.dart';
import 'package:flutter/material.dart';

import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/view/widgets/drawer/drawer_widget.dart';
import 'package:currency_trading/view/widgets/mainLinear_gradient_function.dart';
import 'package:currency_trading/view/widgets/main_appbar_function.dart';
import 'package:get/get.dart';

class AccessScreen extends GetView<GeneralControllerImpl> {
  const AccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GeneralControllerImpl());
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
            width: double.infinity,
            height: double.maxFinite,
            decoration: mainLinearGradient(),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: GetBuilder<GeneralControllerImpl>(
                  builder: (_) => SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomVerticalSizedox(height: 10),
                          Container(
                              decoration: BoxDecoration(boxShadow: const [
                                BoxShadow(
                                    blurRadius: 20,
                                    color: Color.fromARGB(255, 70, 107, 133)),
                              ], borderRadius: BorderRadius.circular(11)),
                              child: const Text('Basic',
                                  style: TextStyle(
                                      color: Color(0XFF34A9FF),
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700))),
                          const CustomVerticalSizedox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AccessCardWidget(
                                  color: Color(0xff00A7FF),
                                  text: 'Signals/Daily'),
                              Container(
                                  height: 50,
                                  color: Colors.white.withOpacity(.2),
                                  width: 1),
                              AccessCardWidget(
                                  color: Color(0xff00A7FF),
                                  text: 'Risk Management'),
                              Container(
                                  height: 50,
                                  color: Colors.white.withOpacity(.2),
                                  width: 1),
                              AccessCardWidget(
                                  color: Color(0xff00A7FF),
                                  text: 'Technical Analysis'),
                            ],
                          ),
                          const CustomVerticalSizedox(height: 18),
                          Row(
                            children: [
                              AccessCardWidget(
                                  color: Color(0xff00A7FF), text: '24/7 Support'),
                              const SizedBox(width: 10),
                              Container(
                                  height: 50,
                                  color: Colors.white.withOpacity(.2),
                                  width: 1),
                              const SizedBox(width: 20),
                              AccessCardWidget(
                                  color: Color(0xff00A7FF), text: 'Auto Trade'),
                            ],
                          ),
                          const CustomVerticalSizedox(height: 20),
                          InkWell(
                            onTap: () => Get.to(
                                () => const AccessBoyScreen(isBasic: true),
                                transition: Transition.downToUp),
                            child:  AccessBoyContainerWidget(
                                text: 'Buy now \$${controller.subscriptionPackageModel?.basic1.toString()} / Month',
                                color: const Color(0xff00A7FF)),
                          ),
                          const CustomVerticalSizedox(height: 40),
                          Container(
                              decoration: BoxDecoration(boxShadow: const [
                                BoxShadow(
                                    blurRadius: 20,
                                    color: Color.fromARGB(255, 139, 113, 33)),
                              ], borderRadius: BorderRadius.circular(11)),
                              child: Text('Ultimate',
                                  style: TextStyle(
                                      color: Color(0XFFF2B80C),
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700))),
                          const CustomVerticalSizedox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AccessCardWidget(
                                  color: Color(0XFFF2B80C),
                                  text: 'Signals/Daily'),
                              Container(
                                  height: 50,
                                  color: Colors.white.withOpacity(.2),
                                  width: 1),
                              AccessCardWidget(
                                  color: Color(0XFFF2B80C),
                                  text: 'Risk Management'),
                              Container(
                                  height: 50,
                                  color: Colors.white.withOpacity(.2),
                                  width: 1),
                              AccessCardWidget(
                                  color: Color(0XFFF2B80C),
                                  text: 'Technical Analysis'),
                            ],
                          ),
                          const CustomVerticalSizedox(height: 18),
                          Row(
                            children: [
                              AccessCardWidget(
                                  color: Color(0XFFF2B80C), text: '24/7 Support'),
                              const SizedBox(width: 10),
                              Container(
                                  height: 50,
                                  color: Colors.white.withOpacity(.2),
                                  width: 1),
                              const SizedBox(width: 10),
                              AccessCardWidget(
                                  color: Color(0XFFF2B80C), text: 'Auto Trade'),
                            ],
                          ),
                          const CustomVerticalSizedox(height: 20),
                          InkWell(
                            onTap: () => Get.to(
                                () => const AccessBoyScreen(isBasic: false),
                                transition: Transition.downToUp),
                            child:  AccessBoyContainerWidget(
                                text: 'Buy now \$${controller.subscriptionPackageModel?.ultimate1} / Month',
                                color:const Color(0xffF2B80C)),
                          ),
                          const CustomVerticalSizedox(height: 20),
                        ]),
                  ),
                ))));
  }
}
