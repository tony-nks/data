import 'package:flutter/material.dart';

class UiTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;

  const UiTextField({
    super.key,
    required this.controller,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
        ),
      ),
    );
  }
}
