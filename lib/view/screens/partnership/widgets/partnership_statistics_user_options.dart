import 'package:flutter/material.dart';

import 'package:currency_trading/shared/custom_vertical_sizedox.dart';

class PartnershipStatisticsUsersOptions extends StatelessWidget {
  const PartnershipStatisticsUsersOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const CustomVerticalSizedox(height: 18),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 32),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Color(0xff383F76)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            'UID: 15',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
          Text('Subscription Times: 15',
              style: TextStyle(fontSize: 14, color: Colors.white))
        ]),
      ),
      const CustomVerticalSizedox(height: 25),
      Table(
          border: TableBorder.all(
              color: Colors.grey.shade800,
              width: 1.0,
              borderRadius: BorderRadius.circular(16)),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
                decoration: BoxDecoration(
                    color: const Color(0xff23252F),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                children: const [
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                          padding: EdgeInsets.only(top: 22, bottom: 22),
                          child: Text(
                            'Type',
                            style: TextStyle(color: Colors.white, fontSize: 11),
                            textAlign: TextAlign.center,
                          ))),
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Text(
                        'Income',
                        style: TextStyle(color: Colors.white, fontSize: 11),
                        textAlign: TextAlign.center,
                      )),
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Text(
                        'Created At',
                        style: TextStyle(color: Colors.white, fontSize: 11),
                        textAlign: TextAlign.center,
                      )),
                ]),
            ...List.generate(
                8,
                (index) => TableRow(
                        decoration: BoxDecoration(
                            color: Color(0xff373A48),
                            borderRadius: index == 7
                                ? BorderRadius.only(
                                    bottomLeft: Radius.circular(16),
                                    bottomRight: Radius.circular(16))
                                : BorderRadius.circular(0),
                            border: Border(
                                bottom: BorderSide(color: Color(0xff575656)))),
                        children: [
                          const TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Text(
                                'Basic',
                                style: TextStyle(
                                    color: Color(0xff34A9FF), fontSize: 11),
                                textAlign: TextAlign.center,
                              )),
                          TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Text(
                                '1 USDT',
                                style: TextStyle(
                                    color: const Color(0xffF7F7F7),
                                    fontSize: 11),
                                textAlign: TextAlign.center,
                              )),
                          const TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 33, vertical: 10),
                                child: Text(
                                  '16/7/2000',
                                  style: TextStyle(
                                      color: const Color(0xffF7F7F7),
                                      fontSize: 11),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                        ]))
          ])
    ]);
  }
}
