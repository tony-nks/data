import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor_skillbox/data/models/app_person/app_person.dart';
import 'package:floor_skillbox/data/models/app_person_dao/app_person_dao.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [AppPerson])
abstract class AppDatabase extends FloorDatabase {
  AppPersonDao get appPersonDao;
}
