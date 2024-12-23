// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:currency_trading/shared/custom_textfield.dart';
import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/icons.dart';

class PartnershipStatisticsUser extends StatelessWidget {
  const PartnershipStatisticsUser({
    super.key,
    required this.onEyeClick,
  });
  final VoidCallback onEyeClick;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const CustomVerticalSizedox(height: 20),
      CustomTextField(
          hintText: 'Search', prefixIcon: Image.asset(IconsAssets.searchIcon)),
      const CustomVerticalSizedox(height: 20),
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
                            'UID',
                            style: TextStyle(color: Colors.white, fontSize: 11),
                            textAlign: TextAlign.center,
                          ))),
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
                        'Joined At',
                        style: TextStyle(color: Colors.white, fontSize: 11),
                        textAlign: TextAlign.center,
                      )),
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Text(
                        'Options',
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
                          TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Text(
                                '1',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11),
                                textAlign: TextAlign.center,
                              )),
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
                                '16/7/2000',
                                style: TextStyle(
                                    color: const Color(0xffF7F7F7),
                                    fontSize: 11),
                                textAlign: TextAlign.center,
                              )),
                          TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 33, vertical: 10),
                                  child: InkWell(
                                      onTap: onEyeClick,
                                      child: Image.asset(
                                          IconsAssets.eyeUserIcon,
                                          width: 12,
                                          height: 20))))
                        ]))
          ])
    ]);
  }
}
