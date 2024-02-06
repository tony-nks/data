import 'package:flutter/material.dart';

class UiCard extends StatelessWidget {
  final Widget child;
  final void Function() onTap;

  const UiCard({
    super.key,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 10,
      child: ListTile(
        minVerticalPadding: 0.0,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        title: child,
        onTap: onTap,
      ),
    );
  }
}
