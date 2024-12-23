import 'package:currency_trading/logic/controllers/signal_details_controller.dart';
import 'package:currency_trading/model/signals/signal_details_model.dart';
import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final List<Color> progressColors = [
  const Color(0xffFF0004),
  const Color(0xff23252F),
  const Color(0xff23252F),
  const Color(0xff23252F),
  const Color(0xff23252F),
  const Color(0xff23252F),
];

class SignalDetailsStatisticsWidget extends StatelessWidget {
  const SignalDetailsStatisticsWidget({
    super.key,
    required this.entry,
    required this.stop,
    required this.tp1,
    required this.tp2,
    required this.tp3,
    required this.tp4,
    required this.tp5,
    required this.price,
    required this.tragets,
  });
  final String entry;
  final double price;
  final String stop;
  final List<Target> tragets;
  final String tp1;
  final String tp2;
  final String tp3;
  final String tp4;
  final String tp5;

  double calculateProgress(double start, double end, double value) {
    if (value <= start) return 0.0;
    if (value >= end) return 1.0;
    return (value - start) / (end - start);
  }

  @override
  Widget build(BuildContext context) {
    final double entryValue = double.tryParse(entry) ?? 0.0;
    final double stopValue = double.tryParse(stop) ?? 0.0;

    final bool isPriceBelowEntry = price < entryValue;
    final double progress = isPriceBelowEntry
        ? calculateProgress(stopValue, entryValue, price)
        : calculateProgress(entryValue, double.parse( tragets.last.target), price);

    final double indicatorPosition = progress * progressColors.length;
    final int activeIndex = indicatorPosition.floor();

    return GetBuilder<SignalDetailsControllerImpl>(
      builder: (controller) =>
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        // Row for labels
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text('Stop', style: TextStyle(color: Colors.white)),
          const Text('Entry', style: TextStyle(color: Colors.white)),
          ...List.generate(
              tragets.length,
              (index) => Text(
                    'TP${index + 1}',
                    style: TextStyle(
                        color: tragets[index].isDone == '1'
                            ? const Color(0xff3D992B)
                            : Colors.white),
                  )),
        ]),
        const SizedBox(height: 5),
        // Row for values
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(stop, style: const TextStyle(color: Colors.white)),
          Text(entry, style: const TextStyle(color: Colors.white)),
          Text(tp1,
              style: TextStyle(
                  color: tragets[0].isDone == '1'
                      ? const Color(0xff3D992B)
                      : Colors.white)),
          Text(tp2,
              style: TextStyle(
                  color: tragets[1].isDone == '1'
                      ? const Color(0xff3D992B)
                      : Colors.white)),
          Text(tp3,
              style: TextStyle(
                  color: tragets[2].isDone == '1'
                      ? const Color(0xff3D992B)
                      : Colors.white)),
          Text(tp4,
              style: TextStyle(
                  color: tragets[3].isDone == '1'
                      ? const Color(0xff3D992B)
                      : Colors.white)),
          Text(tp5,
              style: TextStyle(
                  color: tragets[4].isDone == '1'
                      ? const Color(0xff3D992B)
                      : Colors.white)),
        ]),
        const SizedBox(height: 10),
        Stack(clipBehavior: Clip.none, children: [
          // Progress bar
          Row(
              children: List.generate(progressColors.length, (index) {
            return Expanded(
                child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: index <= activeIndex
                      ? (!isPriceBelowEntry
                          ? const Color(0xffFF0004)
                          : const Color(0xff3D992B))
                      : progressColors[index]),
              height: 20,
            ));
          })),
          // Indicator
          Positioned(
              left: isPriceBelowEntry
                  ? (indicatorPosition / progressColors.length) * 100
                  : (indicatorPosition / progressColors.length) * 200,
              bottom: -6,
              child: Container(
                  width: 4,
                  height: 30,
                  decoration: BoxDecoration(
                      color: const Color(0xff383F76),
                      borderRadius: BorderRadius.circular(1))))
        ])
      ]),
    );
  }
}
