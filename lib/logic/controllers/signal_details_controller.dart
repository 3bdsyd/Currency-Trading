import 'package:currency_trading/model/signals/signal_details_model.dart';
import 'package:currency_trading/repo/signals/signal_details_repo.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class SignalDetailsController extends GetxController {
  Future<void> signalsDetails();
  void openWebUrl();
}

class SignalDetailsControllerImpl extends SignalDetailsController {
  SignalDetailsModel? signalDetailsModel;
  final SignalDetailsRepositoryImpl _repository = SignalDetailsRepositoryImpl();

  int id = Get.arguments['id'];

  @override
  void onInit() {
    super.onInit();
    signalsDetails();
  }

  @override
  Future<void> signalsDetails() async {
    final result = await _repository.signalsDetails(id);
    if (result is SignalDetailsModel) {
      signalDetailsModel = result;
      print('================== succcus');
    } else {
      await signalsDetails();
    }
    update();
  }

  void openWebUrl() async {
    final Uri url = Uri.parse('https://www.google.com');

    if (await canLaunchUrl(url)) {
     await launchUrl(
      url,
      mode: LaunchMode.externalApplication, 
    );
    } else {

    }
  }

  Rx<double> amount = 0.0.obs;

  void calcuteAmount(String value) {
    value == '' ? amount(0): amount(double.parse(value) * (3/100)).toString();
  }
}
