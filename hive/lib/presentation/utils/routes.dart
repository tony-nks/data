import 'package:flutter/material.dart';
import 'package:app_hive/data/models/app_category/app_category.dart';
import 'package:app_hive/data/models/app_record/app_record.dart';
import 'package:app_hive/presentation/consts/keys.dart';
import 'package:app_hive/presentation/consts/routes.dart';
import 'package:app_hive/presentation/ui/screens/screen_categories/screen_categories.dart';
import 'package:app_hive/presentation/ui/screens/screen_not_found.dart';
import 'package:app_hive/presentation/ui/screens/screen_record/screen_record.dart';
import 'package:app_hive/presentation/ui/screens/screen_records/screen_records.dart';

Route<dynamic> generateRoute(RouteSettings settings) => MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) {
        switch (settings.name) {
          case routeCategories:
            return const ScreenCategories();

          case routeRecords:
            final arguments = settings.arguments as Map<String, AppCategory>;
            final category = arguments[keyCategory]!;

            return ScreenRecords(category: category);

          case routeRecord:
            final arguments = settings.arguments as Map<String, AppRecord>;
            final record = arguments[keyRecord]!;

            return ScreenRecord(record: record);

          default:
            return const ScreenNotFound();
        }
      },
    );
