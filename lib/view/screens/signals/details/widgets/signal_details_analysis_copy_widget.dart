import 'package:currency_trading/logic/controllers/signal_details_controller.dart';
import 'package:currency_trading/view/screens/signals/details/widgets/signal_details_totallist_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:svg_flutter/svg.dart';

class SignalDetailsAnalysisCopyWidget extends GetView<SignalDetailsControllerImpl> {
  const SignalDetailsAnalysisCopyWidget({
    super.key,
    required this.text,
    required this.color,
    required this.icon,
  });
  final String text;
  final Color color;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap:           ()=>     signalDetailsDialog(),

        child: Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(8)),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SvgPicture.asset(icon),
              const SizedBox(width: 10),
              Text(text,
                  style: const TextStyle(color: Colors.white, fontSize: 20))
            ])),
      ),
    );
  }
}