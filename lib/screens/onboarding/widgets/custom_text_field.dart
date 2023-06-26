import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;

  const CustomTextField(
      {super.key, required this.hint, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        contentPadding: const EdgeInsets.only(bottom: 5.0, top: 12.5),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
    );
  }
}
