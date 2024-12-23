import 'package:currency_trading/logic/controllers/history_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryCardsGridViewWidget extends StatelessWidget {
  const HistoryCardsGridViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryDetailsControllerImp>(
        builder: (controller) => Expanded(
          child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 120,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 15),
                  itemCount: controller.historyDetailsModel!.data.length,
                  itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: controller.historyDetailsModel!.data[index]
                                              .type ==
                                          'sell' ||
                                      controller.historyDetailsModel!.data[index]
                                              .type ==
                                          'free'
                                  ? const Color(0xff3D992B)
                                  : const Color(0xffFF0004),
                              width: 2),
                          color: const Color(0xff383F76),
                          borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    decoration: BoxDecoration(boxShadow: const [
                                      BoxShadow(
                                          blurRadius: 20,
                                          color:
                                              Color.fromARGB(255, 156, 155, 155))
                                    ], borderRadius: BorderRadius.circular(11)),
                                    child: Text(
                                        controller
                                            .historyDetailsModel!.data[index].type
                                            .toString(),
                                        style: TextStyle(
                                            color: controller.historyDetailsModel!
                                                        .data[index].type ==
                                                    'buy'
                                                ? const Color(0xff00A7FF)
                                                : controller.historyDetailsModel!
                                                            .data[index].type ==
                                                        'sell'
                                                    ? const Color(0xffFF0004)
                                                    : const Color(0xff947FFF),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 19))),
                                Text(
                                    controller.historyDetailsModel!.data[index]
                                        .createdAt
                                        .toString(),
                                    style: const TextStyle(
                                        color: Color(0xffA7A7A7), fontSize: 9)),
                                RichText(
                                    text: TextSpan(
                                        text: controller.historyDetailsModel!
                                            .data[index].leverage
                                            .toString(),
                                        style: const TextStyle(
                                            color: Color(0xff947FFF),
                                            fontSize: 12),
                                        children: <TextSpan>[
                                      const TextSpan(
                                          text: '   -   ',
                                          style: TextStyle(color: Colors.white)),
                                      TextSpan(
                                          text:
                                              'Targets ${controller.historyDetailsModel!.data[index].targets.toString()}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                          )),
                                    ]))
                              ]))))),
        ));
  }
}
