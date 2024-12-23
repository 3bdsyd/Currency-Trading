import 'package:currency_trading/logic/controllers/results_controller.dart';
import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:currency_trading/view/screens/results/widgets/results_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultsCardsGridWidget extends StatelessWidget {
  const ResultsCardsGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResultsControllerImpl>(
        builder: (controller) => Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ResultsCardWidget(
                      icon: IconsAssets.numberOfTradesIcon,
                      title: 'Number of Trades',
                      value: controller.resultsModel != null
                          ? controller.resultsModel!.data.allNum.toString()
                          : ''),
                  const SizedBox(width: 8),
                  ResultsCardWidget(
                      icon: IconsAssets.totalProfitIcon,
                      title: 'Total Profit',
                      value: controller.resultsModel != null
                          ? controller.resultsModel!.data.totalProfit.toString()
                          : ''),
                  const SizedBox(width: 8),
                  ResultsCardWidget(
                      icon: IconsAssets.avgProfitIcon,
                      title: 'Avg.Profit',
                      value: controller.resultsModel != null
                          ? controller.resultsModel!.data.avgProfit.toString()
                          : '')
                ],
              ),
              const CustomVerticalSizedox(height: 8),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                ResultsCardWidget(
                    icon: IconsAssets.winTradesIcon,
                    title: 'Win Trades',
                    value: controller.resultsModel != null
                        ? controller.resultsModel!.data.winNum.toString()
                        : ''),
                const SizedBox(width: 8),
                ResultsCardWidget(
                    icon: IconsAssets.loseTradesIcon,
                    title: 'Lose Trades',
                    value: controller.resultsModel != null
                        ? controller.resultsModel!.data.loseNum.toString()
                        : ''),
                const SizedBox(width: 8),
                ResultsCardWidget(
                    icon: IconsAssets.winRateIcon,
                    title: 'Win Rate',
                    value: controller.resultsModel != null
                        ? controller.resultsModel!.data.winRate.toString()
                        : '')
              ])
            ]));
  }
}
