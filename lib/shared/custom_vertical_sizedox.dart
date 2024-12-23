import 'package:flutter/material.dart';

class CustomVerticalSizedox extends StatelessWidget {
  const CustomVerticalSizedox({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) => SizedBox(height: height);
}
