import 'package:flutter/material.dart';

class SignalsUnderSliderContainerWidget extends StatelessWidget {
  const SignalsUnderSliderContainerWidget(
      {super.key, required this.index, required this.currentIndex});
  final int index;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index
            ? const Color(0xff6E21D1)
            : const Color(0xffD9D9D9),
      ),
      height: 4,
      width: 4,
    );
  }
}
