import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar authAppBar({String title = ''}) {
  return AppBar(
      title: Text(title,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white)),
      leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_rounded),
          color: Colors.white),
      backgroundColor: const Color(0xff454545));
}
