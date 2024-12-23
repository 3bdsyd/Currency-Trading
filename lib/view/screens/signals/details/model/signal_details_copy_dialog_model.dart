import 'package:currency_trading/logic/controllers/signal_details_controller.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:get/get.dart';

class SignalDetailsCopyDialogModel {
  final String icon;
  final String title;
  final String value;

  SignalDetailsCopyDialogModel(
      {required this.icon, required this.title, required this.value});
}
final controller = Get.find<SignalDetailsControllerImpl>();

List<SignalDetailsCopyDialogModel> signalDetailsCopyDialogModelList = [
  SignalDetailsCopyDialogModel(
      icon: IconsAssets.entryIcon,
      title: 'ENTRY',
      value: controller.signalDetailsModel!.data.entry),
  SignalDetailsCopyDialogModel(
      icon: IconsAssets.stopiIcon,
      title: 'STOP',
      value: controller.signalDetailsModel!.data.stop),
  SignalDetailsCopyDialogModel(
      icon: IconsAssets.targetIcon,
      title: 'Target 1',
      value: controller.signalDetailsModel!.data.targets[0].target),
  SignalDetailsCopyDialogModel(
      icon: IconsAssets.targetIcon,
      title: 'Target 2',
      value: controller.signalDetailsModel!.data.targets[1].target),
  SignalDetailsCopyDialogModel(
      icon: IconsAssets.targetIcon,
      title: 'Target 3',
      value: controller.signalDetailsModel!.data.targets[2].target),
  SignalDetailsCopyDialogModel(
      icon: IconsAssets.targetIcon,
      title: 'Target 4',
      value: controller.signalDetailsModel!.data.targets[3].target),
  SignalDetailsCopyDialogModel(
      icon: IconsAssets.targetIcon,
      title: 'Target 5',
      value: controller.signalDetailsModel!.data.targets[4].target),
];
