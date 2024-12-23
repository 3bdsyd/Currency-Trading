import 'package:currency_trading/utils/icons.dart';
import 'package:currency_trading/view/screens/root/root_screen.dart';
import 'package:currency_trading/view/widgets/mainLinear_gradient_function.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToSignalsScreen();
  }

  Future<void> _navigateToSignalsScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const RootScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: mainLinearGradient(),
        child:SvgPicture.asset(IconsAssets.logoIcon),
      ),
    );
  }
}
