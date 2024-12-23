import 'package:currency_trading/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

AppBar mainAppBar(String title, Widget leading, {BuildContext? context}) {
  return AppBar(
      actions: [
        Builder(
            builder: (BuildContext context) => IconButton(
                icon: SvgPicture.asset(IconsAssets.menuIcon, width: 26),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                }))
      ],
      title: Text(title,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white)),
      leading: leading,
      backgroundColor: const Color(0xff454545));
}
