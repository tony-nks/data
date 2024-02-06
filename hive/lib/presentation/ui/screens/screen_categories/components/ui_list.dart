part of '../screen_categories.dart';

class _UiList extends StatelessWidget {
  final Box<AppCategory> box;

  const _UiList({
    required this.box,
  });

  @override
  Widget build(BuildContext context) {
    final categories = box.values.toList();

    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (_, index) => _UiCard(category: categories[index]),
    );
  }
}
