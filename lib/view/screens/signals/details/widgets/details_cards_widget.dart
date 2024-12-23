import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:currency_trading/logic/controllers/signals_controller.dart';
import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/icons.dart';

class DetailsCardsWidget extends StatelessWidget {
  const DetailsCardsWidget({
    super.key,
    required this.createdAt,
    required this.currencyType,
    required this.account,
  });
  final String createdAt;
  final String currencyType;
  final String account;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: GetBuilder<SignalsControllerImpl>(
          builder: (controller) => ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => Container(
                    padding: const EdgeInsets.all(18),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: const Color(0xff23252F),
                        borderRadius: BorderRadius.circular(16)),
                    alignment: Alignment.center,
                    child: Row(children: [
                      Image.asset('assets/images/Group 37207.png', width: 37),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(currencyType,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                          const CustomVerticalSizedox(height: 5),
                          Text(createdAt,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 10))
                        ],
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            color: const Color(0xff263775),
                            borderRadius: BorderRadius.circular(22)),
                        alignment: Alignment.center,
                        child: Text(
                          'Get Basic Or $account\n To See The Details',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                      ),
                      InkWell(
                          // onTap: () =>
                          // Get.to(() => const SignalDetailsScreen()),
                          child: Image.asset(IconsAssets.detailsArrowIcon))
                    ]),
                  ),
              itemCount: 2)),
    );
  }
}
