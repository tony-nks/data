import 'package:flutter/material.dart';
import 'package:app_files/presentation/consts/routes.dart';
import 'package:app_files/presentation/utils/routes.dart';

class UiApp extends StatelessWidget {
  const UiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
      initialRoute: routeImages,
    );
  }
}
