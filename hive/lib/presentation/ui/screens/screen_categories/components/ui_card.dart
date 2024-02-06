part of '../screen_categories.dart';

class _UiCard extends StatelessWidget {
  final AppCategory category;

  const _UiCard({
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return UiCard(
      onTap: () {
        final arguments = {keyCategory: category};

        Navigator.of(context).pushNamed(
          routeRecords,
          arguments: arguments,
        );
      },
      child: Text(category.title),
    );
  }
}
