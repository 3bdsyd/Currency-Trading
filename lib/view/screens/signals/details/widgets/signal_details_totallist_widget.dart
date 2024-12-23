import 'package:currency_trading/logic/controllers/signal_details_controller.dart';
import 'package:currency_trading/view/screens/signals/details/model/signal_details_copy_dialog_model.dart';
import 'package:currency_trading/view/screens/signals/details/widgets/signal_details_copy_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignalDetailsTotalListWidget extends StatelessWidget {
  const SignalDetailsTotalListWidget({
    super.key,
    required this.title,
    required this.total,
  });

  final String title;
  final String total;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          total,
          style: const TextStyle(color: Color(0xffF2B80C)),
          textAlign: TextAlign.end,
        ),
        leading: Text(title,
            style: const TextStyle(color: Colors.white)));
  }
}

Future<dynamic> signalDetailsDialog() {
  return Get.dialog(
    useSafeArea : true,
      barrierDismissible: false,
      GetBuilder<SignalDetailsControllerImpl>(
        builder: (controller) => Center(
          child: SingleChildScrollView(
            child: AlertDialog(
              alignment: Alignment.center ,
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                content: Column(mainAxisSize: MainAxisSize.min, children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                shape: BoxShape.circle),
                            child: const Icon(Icons.close,
                                color: Colors.white, size: 10)),
                        onPressed: () {
                           
                          Get.back();
                        },
                      )),
                  SizedBox(
                    width: 500,
                    height: 500,
                    child: GridView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 18),
                        itemCount: signalDetailsCopyDialogModelList.length,
                        itemBuilder: (context, index) =>
                            SignalDetailsCopyDialogWidget(
                                icon:
                                    signalDetailsCopyDialogModelList[index].icon,
                                title:
                                    signalDetailsCopyDialogModelList[index].title,
                                number: signalDetailsCopyDialogModelList[index]
                                    .value
                                    .toString())),
                  )
                ])),
          ),
        ),
      ));
}