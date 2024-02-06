import 'package:flutter/material.dart';
import 'package:app_hive/presentation/consts/keys.dart';
import 'package:app_hive/presentation/consts/translations.dart';

class UiButtonAdd extends StatelessWidget {
  final Function onAdd;

  const UiButtonAdd({
    super.key,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: ElevatedButton(
        onPressed: () {
          onAdd();

          Navigator.pop(context);
        },
        child: Text(labelsButtons[keyAdd]!),
      ),
    );
  }
}
