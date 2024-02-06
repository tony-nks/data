import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:app_hive/data/models/app_category/app_category.dart';
import 'package:app_hive/data/models/app_record/app_record.dart';
import 'package:app_hive/domain/consts/keys.dart';
import 'package:app_hive/domain/services/service_hive.dart';
import 'package:app_hive/presentation/consts/keys.dart';
import 'package:app_hive/presentation/consts/routes.dart';
import 'package:app_hive/presentation/consts/translations.dart';
import 'package:app_hive/presentation/ui/components/buttons/ui_button_add.dart';
import 'package:app_hive/presentation/ui/components/buttons/ui_button_cancel.dart';
import 'package:app_hive/presentation/ui/components/buttons/ui_button_create.dart';
import 'package:app_hive/presentation/ui/components/ui_card.dart';
import 'package:app_hive/presentation/ui/components/ui_text_field.dart';
part 'components/ui_bottom_sheet.dart';
part 'components/ui_card.dart';
part 'components/ui_list.dart';

class ScreenRecords extends StatelessWidget {
  final AppCategory category;

  const ScreenRecords({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: Hive.box<AppRecord>(boxRecords).listenable(),
          builder: (_, box, __) {
            List<AppRecord> records = box.values
                .where((record) => record.categoryId == category.id)
                .toList();

            return _UiList(records: records);
          },
        ),
      ),
      floatingActionButton: UiButtonCreate(
        widget: _UiBottomSheet(onAdd: _addRecord),
      ),
    );
  }

  Future<void> _addRecord(String title, String? description) async {
    ServiceHive.instance.addRecord(category.id, title, description);
  }
}
