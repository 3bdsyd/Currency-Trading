import 'package:flutter/material.dart';

class TitleTextFieldWidget extends StatelessWidget {
  const TitleTextFieldWidget({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
          text: TextSpan(
              text: title,
              style: const TextStyle(color: Colors.white),
              children: const <TextSpan>[
            TextSpan(text: '*', style: TextStyle(color: Color(0xffFF0004)))
          ])),
    );
  }
}
