import 'package:currency_trading/logic/controllers/signal_details_controller.dart';
import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:currency_trading/view/screens/signals/details/widgets/signal_details_analysis_copy_widget.dart';
import 'package:currency_trading/view/screens/signals/details/widgets/signal_details_card_widget.dart';
import 'package:currency_trading/view/screens/signals/details/widgets/signal_details_statistics_widget.dart';
import 'package:currency_trading/view/screens/signals/details/widgets/signal_details_table_widget.dart';
import 'package:currency_trading/view/screens/signals/details/widgets/signal_details_totallist_widget.dart';
import 'package:currency_trading/view/widgets/drawer/drawer_widget.dart';
import 'package:currency_trading/view/widgets/mainLinear_gradient_function.dart';
import 'package:currency_trading/view/widgets/main_appbar_function.dart';
import 'package:currency_trading/view/widgets/main_circular_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:svg_flutter/svg.dart';

class SignalDetailsScreen extends GetView<SignalDetailsControllerImpl> {
  const SignalDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(SignalDetailsControllerImpl());
    return Scaffold(
        endDrawer: const DrawerWidget(),
        appBar: mainAppBar(
            'Signal Details',
            Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: InkWell(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.arrow_back, color: Colors.white)))),
        body: Container(
            height: double.maxFinite,
            decoration: mainLinearGradient(),
            child: GetBuilder<SignalDetailsControllerImpl>(builder: (_) {
              return controller.signalDetailsModel != null
                  ? SingleChildScrollView(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CustomVerticalSizedox(height: 20),
                                SignalDetailsCardWidget(
                                  currencyType: controller
                                      .signalDetailsModel!.data.currencyType
                                      .toString(),
                                  type: controller
                                              .signalDetailsModel!.data.type ==
                                          'spot'
                                      ? 'Free'
                                      : controller.signalDetailsModel!.data.type
                                          .toString(),
                                  createdAt: DateFormat('dd-MM-yyyy hh:mm a')
                                      .format(controller
                                          .signalDetailsModel!.data.createdAt),
                                  entry: controller
                                      .signalDetailsModel!.data.entry
                                      .toString(),
                                  stop: controller.signalDetailsModel!.data.stop
                                      .toString(),
                                  leverage: controller
                                      .signalDetailsModel!.data.leverage
                                      .toString(),
                                ),
                                const CustomVerticalSizedox(height: 25),
                                const Text(
                                    'The current price indicator according to the Trade.',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 13)),
                                const CustomVerticalSizedox(height: 33),
                                SignalDetailsStatisticsWidget(
                                  stop: controller.signalDetailsModel!.data.stop
                                      .toString(),
                                  entry: controller
                                      .signalDetailsModel!.data.entry
                                      .toString(),
                                      tp1: controller
                                      .signalDetailsModel!.data.targets[0].target
                                    .toString(),
                                    tp2: controller
                                      .signalDetailsModel!.data.targets[1].target
                                    .toString(),
                                    tp3: controller
                                      .signalDetailsModel!.data.targets[2].target
                                    .toString(),
                                    tp4: controller
                                      .signalDetailsModel!.data.targets[3].target
                                    .toString(),
                                    tp5: controller
                                      .signalDetailsModel!.data.targets[4].target
                                    .toString(), price: controller
                                      .signalDetailsModel!.data.currentPrice, tragets:  controller
                                      .signalDetailsModel!.data.targets,
                                ),
                                const CustomVerticalSizedox(height: 28),
                                const Text(
                                    'If the indicator is close to the Entry Point, then it’s still possibleto enter the trade.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 13)),
                                const CustomVerticalSizedox(height: 30),
                                SignalDetailsTableWidget(
                                  currentPrice: controller
                                      .signalDetailsModel!.data.currentPrice
                                      .toString(),
                                  number: controller
                                      .signalDetailsModel!.data.open
                                      .toString(),
                                  ratio: controller
                                      .signalDetailsModel!.data.percentage
                                      .toString(),
                                ),
                                const CustomVerticalSizedox(height: 22),
                                // controller.signalDetailsModel!.data
                                //             .analysisLink !=
                                //         null
                                    // ? 
                                     Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          if( controller
                                      .signalDetailsModel!.data.analysisLink != null)...[
                                    const SignalDetailsAnalysisCopyWidget(
                                                icon: IconsAssets
                                                    .analysiIcon,
                                                text: 'Analysis',
                                                color: Color(0xffF2B80C)),
                                            SizedBox(width: 15),

                                      ]
                                       ,
                                            SignalDetailsAnalysisCopyWidget(
                                                icon: IconsAssets.copyIcon,
                                                text: 'Copy',
                                                color: Color(0xff704EF4))
                                          ])
                                    // : const SignalDetailsAnalysisCopyWidget(
                                    //     icon: IconsAssets.copyIcon,
                                    //     text: 'Copy',
                                    //     color: Color(0xff704EF4)),
                                    ,
                                const CustomVerticalSizedox(height: 23),
                                const Text(
                                    'We recommend that the risk in each trade should be from 3-5% of the total cap.',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17),
                                    textAlign: TextAlign.center),
                                const CustomVerticalSizedox(height: 17),
                                Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xff151515),
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
                                        onChanged: (value){
                                          controller.calcuteAmount(value);
                                        },
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.left,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          decoration: InputDecoration(
                                              hintText: 'Your total amount',
                                              hintStyle: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400),
                                              suffixIcon: SvgPicture.asset(
                                                  IconsAssets.editIcon),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 18),
                                                      
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Colors.white
                                                                  .withOpacity(
                                                                      .1)))),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xffF2B80C),
                                              fontSize: 17)),
                                              Obx(()=>    SignalDetailsTotalListWidget(
                                          title:
                                              'Our recommendation is to invest in this trade',
                                          total: '\$ ${controller.amount.toStringAsFixed(2)}')),
                                   
                                    ])),
                                const CustomVerticalSizedox(height: 20)
                              ])))
                  : const MainCircularProgressWidget();
            })));
  }
}