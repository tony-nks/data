import 'package:flutter/material.dart';

class UiButtonCreate extends StatelessWidget {
  final Widget widget;

  const UiButtonCreate({
    super.key,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (_) => widget,
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
