import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.text,
    this.onTap,
  });
  final String text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            alignment: Alignment.center,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xff263775),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(text,
                style: const TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.2,
                    fontSize: 18,
                    fontWeight: FontWeight.w800))));
  }
}
