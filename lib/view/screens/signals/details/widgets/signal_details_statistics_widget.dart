import 'package:currency_trading/model/signals/signal_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class SignalDetailsStatisticsWidget extends StatefulWidget {
  SignalDetailsStatisticsWidget({
    super.key,
    required this.entry,
    required this.price,
    required this.stop,
    required this.tragets,
    required this.tp1,
    required this.tp2,
    required this.tp3,
    required this.tp4,
    required this.tp5,
    required this.currentPrice,
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
  double currentPrice;
  @override
  State<SignalDetailsStatisticsWidget> createState() =>
      _SignalDetailsStatisticsWidgetState();
}

class _SignalDetailsStatisticsWidgetState
    extends State<SignalDetailsStatisticsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(children: [
          const Text("Stop",
              style: TextStyle(color: Colors.white, fontSize: 9)),
          Text(widget.stop,
              style: const TextStyle(color: Colors.white, fontSize: 9))
        ]),
        Column(children: [
          const Text("Entry",
              style: TextStyle(color: Colors.white, fontSize: 9)),
          Text(widget.entry,
              style: const TextStyle(color: Colors.white, fontSize: 9))
        ]),
        Column(children: [
          const Text("TP1", style: TextStyle(color: Colors.green, fontSize: 9)),
          Text(widget.tp1,
              style: const TextStyle(color: Colors.green, fontSize: 9))
        ]),
        Column(children: [
          const Text("TP2", style: TextStyle(color: Colors.green, fontSize: 9)),
          Text(widget.tp2,
              style: const TextStyle(color: Colors.green, fontSize: 9))
        ]),
        Column(children: [
          const Text("TP3", style: TextStyle(color: Colors.white, fontSize: 9)),
          Text(widget.tp3,
              style: const TextStyle(color: Colors.white, fontSize: 9))
        ]),
        Column(children: [
          const Text("TP4", style: TextStyle(color: Colors.white, fontSize: 9)),
          Text(widget.tp4,
              style: const TextStyle(color: Colors.white, fontSize: 9))
        ]),
        Column(children: [
          const Text("TP5", style: TextStyle(color: Colors.white, fontSize: 9)),
          Text(widget.tp5,
              style: const TextStyle(color: Colors.white, fontSize: 9))
        ])
      ]),
      Stack(children: [
        FlutterSlider(
          values: [
            widget.currentPrice.clamp(
              double.tryParse(widget.stop) ?? 0.0,
              double.tryParse(widget.tp5) ?? 1.0,
            ),
          ],
          min: double.tryParse(widget.stop) ?? double.tryParse(widget.entry),
          max: double.tryParse(widget.tp5) ?? 1.0,
          handlerWidth: 4,
          handlerHeight: 40,
          handler: FlutterSliderHandler(
            child: Container(),
            decoration: BoxDecoration(
              color: const Color(0xff383F76),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          trackBar: FlutterSliderTrackBar(
            activeTrackBar: BoxDecoration(
              color: widget.currentPrice > double.parse(widget.entry)
                  ? const Color(0xff3D992B)
                  : const Color(0xffFF0004),
            ),
            inactiveTrackBar: const BoxDecoration(color: Color(0xff23252F)),
            activeTrackBarHeight: 22,
            inactiveTrackBarHeight: 22,
          ),
          step: const FlutterSliderStep(step: 0.01),
          onDragging: (handlerIndex, lowerValue, upperValue) {
            double minValue = double.tryParse(widget.stop) ?? 0.0;

            if (lowerValue < minValue) {
              lowerValue = minValue; // تقييد القيمة للحد الأدنى
            }

            if (mounted) {
              setState(() {
                widget.currentPrice = lowerValue;
              });
            }
          },
        ),
        Positioned.fill(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(7, (index) {
                  if (index == 0 || index == 6) {
                    return const SizedBox.shrink();
                  }

                  double start = double.tryParse(widget.stop) ?? 1.688;
                  double end = double.tryParse(widget.tp5) ?? 4.12;
                  double position = start + index * (end - start) / 6;

                  return Positioned(
                      left: (position - start) /
                          (end - start) *
                          MediaQuery.of(context).size.width,
                      child: Container(
                          width: 1,
                          height: 22,
                          color: Colors.white.withOpacity(.2)));
                })))
      ])
    ]);
  }
}