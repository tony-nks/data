import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_files/data/repositories/repository_images/repository_images_imp.dart';
import 'package:app_files/domain/blocs/bloc_images.dart';
import 'package:app_files/domain/blocs/bloc_images_event.dart';
import 'package:app_files/presentation/consts/routes.dart';
import 'package:app_files/presentation/ui/screens/screen_images/screen_images.dart';
import 'package:app_files/presentation/ui/screens/screen_not_found.dart';

Route<dynamic> generateRoute(RouteSettings settings) => MaterialPageRoute(
      settings: settings,
      builder: (_) {
        switch (settings.name) {
          case routeImages:
            return BlocProvider<BlocImages>(
              create: (_) => BlocImages(repo: RepositoryImagesImp())
                ..add(BlocImagesEventInit()),
              child: const ScreenImages(),
            );

          default:
            return const ScreenNotFound();
        }
      },
    );
