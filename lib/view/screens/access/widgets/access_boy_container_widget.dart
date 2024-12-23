import 'package:flutter/material.dart';

class AccessBoyContainerWidget extends StatelessWidget {
  const AccessBoyContainerWidget({
    super.key,
    required this.color,
    required this.text,
    
  });
  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 56,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: color),
        child: Text(text,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500)));
  }
}
