import 'package:flutter/material.dart';
import 'package:app_files/presentation/consts/keys.dart';
import 'package:app_files/presentation/consts/translations.dart';
import 'package:app_files/presentation/ui/components/ui_app_bar.dart';

class ScreenNotFound extends StatelessWidget {
  const ScreenNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiAppBar(
        title: labelsNotFound[keyTitle]!,
      ),
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
