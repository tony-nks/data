import 'package:flutter/material.dart';
import 'package:app_hive/presentation/consts/keys.dart';
import 'package:app_hive/presentation/consts/translations.dart';

class ScreenNotFound extends StatelessWidget {
  const ScreenNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            labelsNotFound[keyContent]!,
          ),
        ),
      ),
    );
  }
}
