import 'package:currency_trading/view/screens/root/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrencyTradingApp extends StatelessWidget {
  const CurrencyTradingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(fontFamily: 'Dubai'),
        home: const RootScreen(),
        debugShowCheckedModeBanner: false);
  }
}
