import 'package:flutter/material.dart';
import 'package:app_hive/data/models/app_record/app_record.dart';

class ScreenRecord extends StatelessWidget {
  final AppRecord record;

  const ScreenRecord({
    super.key,
    required this.record,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(record.id),
                if (record.description != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(record.description!),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
