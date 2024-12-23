import 'package:currency_trading/view/screens/access/access_screen.dart';
import 'package:currency_trading/view/screens/history/history_screen.dart';
import 'package:currency_trading/view/screens/partnership/partnership_screen.dart';
import 'package:currency_trading/view/screens/results/results_screen.dart';
import 'package:currency_trading/view/screens/signals/signals_screen.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  int currentIndex = 3;
  void seletedPage(int index) {
    currentIndex = index;
    update();
  }

  final screens = const [
    PartnershipScreen(),
    SignalsScreen(),
    HistoryScreen(),
    SignalsScreen(),
    ResultsScreen(),
    AccessScreen(),
  ];
}
