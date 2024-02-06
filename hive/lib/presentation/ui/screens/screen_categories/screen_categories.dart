import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:app_hive/data/models/app_category/app_category.dart';
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

class ScreenCategories extends StatelessWidget {
  const ScreenCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: Hive.box<AppCategory>(boxCategories).listenable(),
          builder: (_, box, __) => _UiList(box: box),
        ),
      ),
      floatingActionButton: UiButtonCreate(
        widget: _UiBottomSheet(
          onAdd: ServiceHive.instance.addCategory,
        ),
      ),
    );
  }
}
