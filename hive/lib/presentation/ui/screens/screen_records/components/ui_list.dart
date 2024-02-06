part of '../screen_records.dart';

class _UiList extends StatelessWidget {
  final List<AppRecord> records;

  const _UiList({
    required this.records,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: records.length,
      itemBuilder: (_, index) => _UiCard(record: records[index]),
    );
  }
}
