// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:safe_area/core/Data/Database/hive_database_manager.dart';

import 'package:safe_area/ui/Screens/splash/splash_screen.dart';
import 'package:safe_area/ui/theme/my_themes.dart';

final class _AppInitialize {
  _AppInitialize._();

  static Future<void> initialize() async {
    await HiveDatabaseManager().Initialize();
  }
}

Future<void> main() async {
  await _AppInitialize.initialize();

  runApp(
    GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: MyAppThemes.lightTheme,
        darkTheme: MyAppThemes.darkTheme,
        home: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
