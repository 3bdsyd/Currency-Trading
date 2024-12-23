import 'package:currency_trading/model/signals/signals_model.dart';
import 'package:currency_trading/model/signals/signals_slider_model.dart';
import 'package:currency_trading/repo/signals/signals_repo.dart';
import 'package:currency_trading/view/screens/signals/details/screens/signal_details_screen.dart';
import 'package:get/get.dart';

abstract class SignalsController extends GetxController {
  Future<void> sliderImages();
  Future<void> signals();
}

class SignalsControllerImpl extends SignalsController {
  final SignalsRepositoryImpl _repository = SignalsRepositoryImpl();
  SignalsSliderModel? signalsSliderModel;

  @override
  Future<void> sliderImages() async {
    final result = await _repository.fetchSliderImages();
    if (result is SignalsSliderModel) {
      signalsSliderModel = result;
      print('=================== succcus slider');
      print(result.data.length);
    } else {
      await sliderImages();
    }
    update();
  }

  // ===================

  SignalsModel? signalsModel;

  @override
  Future<void> signals() async {
    final result = await _repository.signals();
    if (result is SignalsModel) {
      signalsModel = result;
      print('================== succcus signals');
    } else {
      await signals();
    }
    update();
  }

  void toSignalDetailsScreen(int id) {
    Get.to(() => const SignalDetailsScreen(),
        arguments: {'id': id},
        transition: Transition.leftToRight);
  }

  @override
  void onInit() {
    super.onInit();
    sliderImages();
    signals();
  }
}
