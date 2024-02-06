import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_files/domain/blocs/bloc_images.dart';
import 'package:app_files/domain/blocs/bloc_images_event.dart';
import 'package:app_files/domain/blocs/bloc_images_state.dart';
import 'package:app_files/presentation/consts/keys.dart';
import 'package:app_files/presentation/consts/translations.dart';
import 'package:app_files/presentation/ui/components/buttons/ui_button_create.dart';
import 'package:app_files/presentation/ui/components/buttons/ui_button_save.dart';
import 'package:app_files/presentation/ui/components/ui_app_bar.dart';
import 'package:app_files/presentation/ui/components/ui_card.dart';
import 'package:app_files/presentation/ui/components/ui_text_field.dart';

part 'components/ui_bottom_sheet.dart';
part 'components/ui_card.dart';
part 'components/ui_data_empty.dart';
part 'components/ui_list.dart';

class ScreenImages extends StatelessWidget {
  const ScreenImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiAppBar(title: labelsImages[keyTitle]!),
      body: SafeArea(
        child: BlocBuilder<BlocImages, BlocImagesState>(
          builder: (_, state) => state.when(
            init: () => _UiEmptyData(text: labelsImages[keyContent]!),
            loaded: (images) => _UiList(images: images),
          ),
        ),
      ),
      floatingActionButton: UiButtonCreate(
        widget: _UiBottomSheet(
          onAdd: (String url) => context.read<BlocImages>().add(
                BlocImagesEventAdd(url: url),
              ),
        ),
      ),
    );
  }
}
