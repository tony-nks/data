import 'package:hive/hive.dart';

part 'app_category.g.dart';

@HiveType(typeId: 0)
class AppCategory extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  AppCategory({
    required this.id,
    required this.title,
  });
}
