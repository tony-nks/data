part of '../screen_records.dart';

class _UiCard extends StatelessWidget {
  final AppRecord record;

  const _UiCard({
    required this.record,
  });

  @override
  Widget build(BuildContext context) {
    return UiCard(
      onTap: () {
        final arguments = {keyRecord: record};

        Navigator.of(context).pushNamed(
          routeRecord,
          arguments: arguments,
        );
      },
      child: Text(record.title),
    );
  }
}
