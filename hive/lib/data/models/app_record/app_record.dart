import 'package:hive/hive.dart';

part 'app_record.g.dart';

@HiveType(typeId: 1)
class AppRecord extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String? description;

  @HiveField(3)
  String categoryId;

  AppRecord({
    required this.id,
    required this.categoryId,
    required this.title,
    this.description,
  });
}
