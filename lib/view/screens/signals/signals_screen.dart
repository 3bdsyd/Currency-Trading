import 'package:carousel_slider/carousel_slider.dart';
import 'package:currency_trading/core/services/app_services.dart';
import 'package:currency_trading/logic/controllers/signals_controller.dart';
import 'package:currency_trading/utils/constants/app_key.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:currency_trading/view/screens/signals/widgets/signals_container_slider_box_widget.dart';
import 'package:currency_trading/view/screens/signals/widgets/signals_cards_widget.dart';
import 'package:currency_trading/view/screens/signals/widgets/signals_under_slider_container_widget.dart';
import 'package:currency_trading/view/widgets/drawer/drawer_widget.dart';
import 'package:currency_trading/view/widgets/main_circular_progress_widget.dart';
import 'package:currency_trading/view/widgets/main_name_container_widget.dart';
import 'package:flutter/material.dart';

import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/view/widgets/mainLinear_gradient_function.dart';
import 'package:currency_trading/view/widgets/main_appbar_function.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

final token = Get.find<MyServices>().getBox.read(AppKey.token);

class SignalsScreen extends StatefulWidget {
  const SignalsScreen({super.key});

  @override
  State<SignalsScreen> createState() => _SignalsScreenState();
}

class _SignalsScreenState extends State<SignalsScreen> {
  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);

  @override
  void dispose() {
    _currentIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(SignalsControllerImpl());

    return Scaffold(
        endDrawer: const DrawerWidget(),
        appBar: mainAppBar(
            'Home',
            Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Image.asset(IconsAssets.logoIcon)
            )),
        body: Container(
            height: double.maxFinite,
            decoration: mainLinearGradient(),
            child: GetBuilder<SignalsControllerImpl>(
              builder: (controller) => controller.signalsSliderModel != null
                  ? SingleChildScrollView(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CustomVerticalSizedox(height: 10),
                                if (token != null) ...[
                                  const MainNameContainerWidget()
                                ],
                                CustomVerticalSizedox(
                                    height: token != null ? 20 : 10),
                                controller.signalsSliderModel != null
                                    ? CarouselSlider(
                                        items:
                                            controller.signalsSliderModel!.data
                                                .map(
                                                  (e) =>
                                                      SignalsContainerSliderBoxWidget(
                                                    image: e.image,
                                                  ),
                                                )
                                                .toList(),
                                        options: CarouselOptions(
                                            onPageChanged: (index, reason) {
                                              _currentIndexNotifier.value =
                                                  index;
                                            },
                                            height: 180,
                                            initialPage: 0,
                                            enlargeCenterPage: true,
                                            autoPlay: true))
                                    : const SizedBox.shrink(),
                                const CustomVerticalSizedox(height: 10),
                                ValueListenableBuilder<int>(
                                    valueListenable: _currentIndexNotifier,
                                    builder: (context, currentIndex, child) {
                                      return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: List.generate(
                                              controller.signalsSliderModel!
                                                  .data.length,
                                              (index) =>
                                                  SignalsUnderSliderContainerWidget(
                                                      index: index,
                                                      currentIndex:
                                                          currentIndex)));
                                    }),
                                const CustomVerticalSizedox(height: 20),
                                const SignalsCardsWidget(),
                                const CustomVerticalSizedox(height: 20)
                              ])))
                  : const MainCircularProgressWidget(),
            )));
  }
}