import 'package:flutter/material.dart';

class PrimaryTextFilled extends StatelessWidget {
  const PrimaryTextFilled({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.maxLines,
  });

  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final int ?maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      maxLines: maxLines ?? null,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
    );
  }
}

OutlineInputBorder buildOutlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
  );
}
