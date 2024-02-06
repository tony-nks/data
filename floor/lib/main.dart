import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:floor_skillbox/data/repositories/repository_persons/repository_persons_imp.dart';
import 'package:floor_skillbox/domain/blocs/bloc_persons.dart';
import 'package:floor_skillbox/domain/blocs/bloc_persons_event.dart';
import 'package:floor_skillbox/presentation/ui/components/ui_app.dart';

void main() {
  runApp(
    BlocProvider<BlocPersons>(
      create: (_) => BlocPersons(repo: RepositoryPersonsImp())
        ..add(BlocPersonsEventInit()),
      child: const UiApp(),
    ),
  );
}
