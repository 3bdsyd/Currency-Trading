import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:flutter/material.dart';

class HistoryInfoCardsWidget extends StatelessWidget {
  const HistoryInfoCardsWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.number,
  });

  final String icon;
  final String label;
  final String number;
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomVerticalSizedox(height: 10),
          Image.asset(icon),
          const CustomVerticalSizedox(height: 10),
          Text('$label\n\n $number',
              style: const TextStyle(fontSize: 12, color: Colors.white),
              textAlign: TextAlign.center)
        ]);
  }
}
