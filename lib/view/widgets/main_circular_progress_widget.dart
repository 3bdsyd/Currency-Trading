import 'package:flutter/material.dart';

class MainCircularProgressWidget extends StatelessWidget {
  const MainCircularProgressWidget({
    super.key,
    this.color
  });
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return  Center(
        child: CircularProgressIndicator(
      color: color ?? const Color(0xffF2B80C),
      backgroundColor: const Color(0xff454545),
    ));
  }
}
