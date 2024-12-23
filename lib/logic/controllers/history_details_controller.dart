import 'package:currency_trading/model/history_details_model.dart';
import 'package:currency_trading/repo/history_repo.dart';
import 'package:get/get.dart';

abstract class HistoryDetailsController extends GetxController {
  Future<void> historyDetails();
}

class HistoryDetailsControllerImp extends HistoryDetailsController {
  final HistoryRepositoryImpl _repository = HistoryRepositoryImpl();
  HistoryDetailsModel? historyDetailsModel;
  String name = Get.arguments['name'];

  @override
  void onInit() {
    historyDetails();
    super.onInit();
  }

  @override
  Future<void> historyDetails() async {
    final result = await _repository.fetchHistoryDetails(name);
    if (result is HistoryDetailsModel) {
      historyDetailsModel = result;
      print('====================== succcus history details');
    } else {
      await historyDetails();
    }
    update();
  }
}
