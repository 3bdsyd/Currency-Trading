import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class AccessCardWidget extends StatelessWidget {
  const AccessCardWidget({
    super.key,
    required this.color,
    required this.text,
  });
  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return
        Column(children: [
      Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.w700, color: Color(0xffF7F7F7)),
      ),
      const CustomVerticalSizedox(height: 10),
     text=='Signals/Daily'?Text(color==const Color(0xff00A7FF)? '1': '+3', style: TextStyle(color: color),): color==const Color(0xff00A7FF) && text == 'Auto Trade'? SvgPicture.asset(IconsAssets.cancleIcon):Image.asset(IconsAssets.rightIcon, color: color)
    ]);
  }
}
