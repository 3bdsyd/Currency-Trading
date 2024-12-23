import 'package:currency_trading/model/history_model.dart';
import 'package:currency_trading/repo/history_repo.dart';
import 'package:currency_trading/view/screens/history/history_cards_screen.dart';
import 'package:get/get.dart';

abstract class HistoryController extends GetxController {
  Future<void> history();
  void toHistoryDetails(String name);
}

class HistoryControllerImpl extends HistoryController {
  final HistoryRepositoryImpl _repository = HistoryRepositoryImpl();
  List<HistoryModel> historyMod = [];
  @override
  void onInit() {
    super.onInit();
    history();
  }

  @override
  Future<void> history() async {
    final result = await _repository.fetchHistory();
    if (result is List<HistoryModel>) {
      historyMod = result;
      print('====================== succcus history ');
    } else {
      await history();
    }
    update();
  }

  @override
  void toHistoryDetails(String name) {
    Get.to(() => const HistoryCardsScreen(), arguments: {'name': name}, transition: Transition.leftToRight);
  }
}
