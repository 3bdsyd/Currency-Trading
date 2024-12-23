import 'package:flutter/material.dart';

class AccessMonthsWidget extends StatelessWidget {
  const AccessMonthsWidget(
      {super.key, required this.numberMonth, required this.value, required this.isBasic});
  final int numberMonth;
  final String value;
  final bool isBasic;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: [
        Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Color(0xff383F76),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            child: Text('${numberMonth.toString()} Month',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700))),
        Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            decoration:  BoxDecoration(
                color: isBasic? const Color(0xff34A9FF) : const Color(0xffF2B80C),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16))),
            child: Text('$value USDT',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500)))
      ]),
    );
  }
}
