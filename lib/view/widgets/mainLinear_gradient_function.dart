import 'package:flutter/material.dart';

BoxDecoration mainLinearGradient() {
  return const BoxDecoration(
      gradient: LinearGradient(
          end: Alignment.bottomCenter,
          begin: Alignment.center,
          colors: [Color(0xff454545), Color(0xff151515), Color(0xff151515)]));
}
