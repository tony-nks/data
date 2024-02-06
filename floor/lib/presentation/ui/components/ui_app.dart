import 'package:flutter/material.dart';
import 'package:floor_skillbox/presentation/consts/routes.dart';
import 'package:floor_skillbox/presentation/ui/styles/themes.dart';
import 'package:floor_skillbox/presentation/utils/routes.dart';

class UiApp extends StatelessWidget {
  const UiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: defaultTheme,
      onGenerateRoute: generateRoute,
      initialRoute: routePersons,
    );
  }
}
