import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:app_hive/data/models/app_category/app_category.dart';
import 'package:app_hive/data/models/app_record/app_record.dart';
import 'package:app_hive/domain/consts/keys.dart';

class ServiceHive {
  ServiceHive._();

  static final instance = ServiceHive._();

  factory ServiceHive() => instance;

  Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(AppCategoryAdapter());
    Hive.registerAdapter(AppRecordAdapter());

    await Hive.openBox<AppCategory>(boxCategories);
    await Hive.openBox<AppRecord>(boxRecords);
  }

  void addCategory(String title) async {
    final categories = await Hive.openBox<AppCategory>(boxCategories);

    categories.add(
      AppCategory(
        id: const Uuid().v4(),
        title: title,
      ),
    );
  }

  void addRecord(
    String categoryId,
    String title,
    String? description,
  ) async {
    final records = await Hive.openBox<AppRecord>(boxRecords);

    records.add(
      AppRecord(
        id: const Uuid().v4(),
        title: title,
        description: description,
        categoryId: categoryId,
      ),
    );
  }
}
