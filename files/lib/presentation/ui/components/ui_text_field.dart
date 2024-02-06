import 'package:flutter/material.dart';

class UiTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final Widget? suffix;

  const UiTextField({
    super.key,
    required this.controller,
    this.labelText,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, bottom: 16.0, right: 16.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          suffix: suffix,
        ),
      ),
    );
  }
}
