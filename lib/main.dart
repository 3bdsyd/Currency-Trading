import 'package:currency_trading/core/services/app_services.dart';
import 'package:currency_trading/currency_trandig_app.dart';
import 'package:flutter/material.dart';

// import 'package:device_preview/device_preview.dart';
void main() async {
  await initialServices();
  runApp(const CurrencyTradingApp());
}
