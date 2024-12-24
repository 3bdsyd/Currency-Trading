import 'package:currency_trading/logic/controllers/results_controller.dart';
import 'package:currency_trading/view/screens/results/widgets/results_cards_grid_widget.dart';
import 'package:currency_trading/view/screens/results/widgets/results_total_list_widget.dart';
import 'package:currency_trading/view/widgets/main_circular_progress_widget.dart';
import 'package:currency_trading/view/widgets/main_name_container_widget.dart';
import 'package:flutter/material.dart';

import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:currency_trading/view/widgets/drawer/drawer_widget.dart';
import 'package:currency_trading/view/widgets/mainLinear_gradient_function.dart';
import 'package:currency_trading/view/widgets/main_appbar_function.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

double _result = 0;

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResultsControllerImpl());

    return Scaffold(
        endDrawer: const DrawerWidget(),
        appBar: mainAppBar(
            'Partnership',
            Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: InkWell(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.arrow_back, color: Colors.white)))),
        body: Container(
            width: double.infinity,
            height: double.maxFinite,
            decoration: mainLinearGradient(),
            child: GetBuilder<ResultsControllerImpl>(
                builder: (controller) => controller.resultsModel != null
                    ? SingleChildScrollView(
                        child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CustomVerticalSizedox(height: 10),
                                  const MainNameContainerWidget(),
                                  SizedBox(
                                      width: double.infinity,
                                      height: 65,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: List.generate(
                                              5,
                                              (index) => InkWell(
                                                  onTap: () {
                                                    controller
                                                        .selectTime(index);
                                                  },
                                                  child: Container(
                                                      width: 65,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              width: 1,
                                                              color: controller
                                                                          .selectedIndex ==
                                                                      index
                                                                  ? const Color(
                                                                      0xff00A7FF)
                                                                  : Colors.white
                                                                      .withOpacity(
                                                                          .1)),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7),
                                                          color: controller
                                                                      .selectedIndex ==
                                                                  index
                                                              ? const Color(0xff267CBC)
                                                              : const Color(0xff757575)),
                                                      child: Text(controller.timeItem[index], style: const TextStyle(color: Colors.white, fontSize: 19))))))),
                                  const CustomVerticalSizedox(height: 28),
                                  const ResultsCardsGridWidget(),
                                  const CustomVerticalSizedox(height: 23),
                                  const Text(
                                      'This means, if you invest a certain amount of money in each of these trades, this would be the outcome',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17),
                                      textAlign: TextAlign.center),
                                  const CustomVerticalSizedox(height: 23),
                                  Container(
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                              color:
                                                  Colors.white.withOpacity(.1)),
                                          boxShadow: const [
                                            BoxShadow(
                                                offset: Offset(0, 5),
                                                blurRadius: 11,
                                                color: Color.fromARGB(
                                                    255, 37, 37, 37))
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: Column(children: [
                                        const CustomVerticalSizedox(height: 10),
                                        TextField(
                                            onChanged: (value) {
                                              if (controller.resultsController
                                                  .text.isNotEmpty) {
                                                try {
                                                  double input = double.parse(
                                                      controller
                                                          .resultsController
                                                          .text);
                                                  _result = input *
                                                      controller.resultsModel!
                                                          .data.multiple;
                                                } catch (e) {
                                                  _result = 0;
                                                }
                                              } else {
                                                _result = 0;
                                              }
                                            },
                                            controller: controller
                                                .resultsController,
                                            keyboardType: TextInputType.number,
                                            textAlignVertical: TextAlignVertical
                                                .center,
                                            decoration: InputDecoration(
                                                suffixIcon: SvgPicture.asset(
                                                  IconsAssets.editIcon,
                                                  alignment: Alignment.center,
                                                  fit: BoxFit.scaleDown,
                                                ),
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 18),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .white
                                                                .withOpacity(
                                                                    .1)))),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xffF2B80C),
                                                fontSize: 17),
                                            textAlign: TextAlign.center),
                                        StreamBuilder(
                                            stream: controller
                                                .streamController.stream,
                                            builder: (context, snapshot) =>
                                                ResultsTotalListWidget(
                                                    title:
                                                        'Your Profit after ${controller.selectedIndex == 0 ? '1 Week' : controller.selectedIndex == 1 ? '1 Month' : controller.selectedIndex == 2 ? '3 Months' : controller.selectedIndex == 3 ? '6 Months' : '1 Year'}',
                                                    total: snapshot
                                                                .connectionState ==
                                                            ConnectionState
                                                                .waiting
                                                        ? 1.1
                                                        : double.parse(_result
                                                            .toStringAsFixed(
                                                                3))))
                                      ])),
                                  const CustomVerticalSizedox(height: 23),
                                  const Text(
                                      'Start earning profits now! Subscribe and become a member of our community.',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17),
                                      textAlign: TextAlign.center),
                                  const CustomVerticalSizedox(height: 20)
                                ])))
                    : const MainCircularProgressWidget())));
  }
}