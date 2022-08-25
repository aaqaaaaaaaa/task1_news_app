import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.label,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        readOnly: true,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white24)),
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.white24,
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white24)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white24)),
        ),
      ),
    );
  }
}
