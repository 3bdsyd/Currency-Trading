import 'package:currency_trading/logic/controllers/root_controller.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootScreen extends GetView<RootController> {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RootController());

    return GetBuilder<RootController>(
        builder: (_) => Scaffold(
            body: IndexedStack(
              index: controller.currentIndex,
              children: controller.screens,
            ),
            bottomNavigationBar: Stack(children: [
              BottomNavigationBar(
                  backgroundColor: const Color(0xff1f2439),
                  type: BottomNavigationBarType.fixed,
                  elevation: 0,
                  onTap: (value) => controller.seletedPage(value),
                  selectedItemColor: const Color(0xffF2B80C),
                  unselectedItemColor: Colors.white,
                  currentIndex: controller.currentIndex,
                  items: [
                    BottomNavigationBarItem(
                        backgroundColor: const Color(0xff1f2439),
                        icon: Image.asset(IconsAssets.partnershipIcon,
                            width: 30,
                            color: controller.currentIndex == 0
                                ? const Color(0xffF2B80C)
                                : Colors.white),
                        label: 'Partnership'),
                    BottomNavigationBarItem(
                        backgroundColor: const Color(0xff1f2439),
                        icon: Image.asset(IconsAssets.supportIcon,
                            width: 30,
                            color: controller.currentIndex == 1
                                ? const Color(0xffF2B80C)
                                : Colors.white),
                        label: 'Support'),
                    BottomNavigationBarItem(
                        backgroundColor: const Color(0xff1f2439),
                        icon: Image.asset(IconsAssets.historyIcon,
                            width: 30,
                            color: controller.currentIndex == 2
                                ? const Color(0xffF2B80C)
                                : Colors.white),
                        label: 'History'),
                    BottomNavigationBarItem(
                        backgroundColor: const Color(0xff1f2439),
                        icon: Image.asset(IconsAssets.signalsIcon,
                            width: 30,
                            color: controller.currentIndex == 3
                                ? const Color(0xffF2B80C)
                                : Colors.white),
                        label: 'Signals'),
                    BottomNavigationBarItem(
                        backgroundColor: const Color(0xff1f2439),
                        icon: Image.asset(IconsAssets.resultsIcon,
                            width: 30,
                            color: controller.currentIndex == 4
                                ? const Color(0xffF2B80C)
                                : Colors.white),
                        label: 'Results'),
                    BottomNavigationBarItem(
                        backgroundColor: const Color(0xff1f2439),
                        icon: Image.asset(IconsAssets.accessIcon,
                            width: 30,
                            color: controller.currentIndex == 5
                                ? const Color(0xffF2B80C)
                                : Colors.white),
                        label: 'Access')
                  ]),
              Container(
                  width: double.infinity,
                  height: 5,
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.white,
                        blurRadius: 30,
                        spreadRadius: .5,
                        offset: Offset.zero)
                  ]))
            ])));
  }
}
