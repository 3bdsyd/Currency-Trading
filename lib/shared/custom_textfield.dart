import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.prefixIcon,
      this.suffixIcon,
      this.controller,
      this.validator,
      this.hintText,
      this.obscureText});
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final Function(String value)? validator;
  final bool? obscureText;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: const Color(0xffF2B80C),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText ?? false,
      validator: validator != null ? (value) => validator!(value!) : null,
      controller: controller,
      decoration: InputDecoration(
        
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: const Color(0xff282828),
          prefixIcon:
              Padding(padding: const EdgeInsets.all(15.0), child: prefixIcon),
          suffixIcon: suffixIcon != null
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: suffixIcon!,
                )
              : null,
          labelStyle: const TextStyle(color: Colors.white)),
      style: const TextStyle(color: Colors.white),
    );
  }
}
