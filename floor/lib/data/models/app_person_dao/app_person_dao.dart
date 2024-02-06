import 'package:floor/floor.dart';
import 'package:floor_skillbox/data/models/app_person/app_person.dart';

@dao
abstract class AppPersonDao {
  @Query('SELECT * FROM AppPerson')
  Future<List<AppPerson>> getPersons();

  @Query('SELECT * FROM AppPerson WHERE id = :id')
  Stream<AppPerson?> getPersonById(int id);

  @Query('DELETE FROM AppPerson WHERE id = :id')
  Future<void> removePersonById(int id);

  @Query('DROP TABLE AppPerson')
  Future<void> dropTable();

  @Query('SELECT * FROM AppPerson WHERE id = (SELECT MAX(id) FROM AppPerson)')
  Future<AppPerson?> getMaxId();

  @Query(
      'UPDATE AppPerson SET name = :name, surname = :surname, age = :age, avatar = :avatar, phone = :phone WHERE id = :id')
  Future<void> updatePerson(
    int id,
    String name,
    String surname,
    int age,
    String phone,
    String avatar,
  );

  @insert
  Future<void> addPerson(AppPerson person);
}
