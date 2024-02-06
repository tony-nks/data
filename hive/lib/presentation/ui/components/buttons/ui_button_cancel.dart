import 'package:flutter/material.dart';
import 'package:app_hive/presentation/consts/keys.dart';
import 'package:app_hive/presentation/consts/translations.dart';

class UiButtonCancel extends StatelessWidget {
  final void Function() onClear;

  const UiButtonCancel({
    super.key,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: OutlinedButton(
        onPressed: () {
          onClear();

          Navigator.pop(context);
        },
        child: Text(labelsButtons[keyCancel]!),
      ),
    );
  }
}
