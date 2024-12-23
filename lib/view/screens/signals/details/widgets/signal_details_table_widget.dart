
import 'package:currency_trading/logic/controllers/signal_details_controller.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

class SignalDetailsTableWidget extends StatelessWidget {
  const SignalDetailsTableWidget({
    super.key,
    required this.currentPrice,
    required this.number,
    required this.ratio,
  });
  final String currentPrice;
  final String number;
  final String ratio;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignalDetailsControllerImpl>(
      builder: (controller) => Table(
          border: TableBorder.symmetric(
            outside: BorderSide.none,
            inside: BorderSide(color:  Colors.grey.shade800),
        
              borderRadius: BorderRadius.circular(16)),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
                decoration: const BoxDecoration(
                    color: Color(0xff23252F),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                children: [
             const     TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                          padding: EdgeInsets.only(top: 22, bottom: 22),
                          child: Text(
                            'Current Price',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ))),
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Text(
                      controller.signalDetailsModel!.data.currentPrice.toString(),
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      )),
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${controller.signalDetailsModel!.data.percentage.toString()}%',
                              style:const TextStyle(color:  Color(0xff3D992B)),
                              textAlign: TextAlign.center),
                          SvgPicture.asset(IconsAssets.upTableIcon)
                        ],
                      ))
                ]),
            ...List.generate(
                controller.signalDetailsModel!.data.targets.length,
                (index) => TableRow(
                        decoration:  BoxDecoration(
                          color: const Color(0xff373A48),
                          borderRadius: BorderRadius.only(bottomLeft:  Radius.circular(index ==
                                      controller.signalDetailsModel!.data
                                              .targets.length -
                                          1
                                  ? 16:0), 
                                     bottomRight: 
                           Radius.circular(index ==
                                      controller.signalDetailsModel!.data
                                              .targets.length -
                                          1
                                  ? 16:0
                           ))),
                        children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Text(
                                'Target ${index+1}',
                                style: TextStyle(
                                    color: controller.signalDetailsModel!.data
                                                .targets[index].isDone ==
                                            '1'
                                        ? const Color(0xff40ad2f)
                                        : Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Text(
                                controller.signalDetailsModel!.data
                                    .targets[index].target
                                    .toString(),
                                style: TextStyle(
                                    color: controller.signalDetailsModel!.data
                                                .targets[index].isDone ==
                                            '1'
                                        ? const Color(0xff40ad2f)
                                        : Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11),
                                textAlign: TextAlign.center,
                              )),
                          TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Text(
                                '${controller.signalDetailsModel!.data.targets[index].percentage}%',
                                style: TextStyle(
                                    color: controller.signalDetailsModel!.data
                                                .targets[index].isDone ==
                                            '1'
                                        ? const Color(0xff40ad2f)
                                        : Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11),
                                textAlign: TextAlign.center,
                              )),
                        ]))
          ]),
    );
  }
}
