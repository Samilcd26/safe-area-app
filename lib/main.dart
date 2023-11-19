import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safe_area/Screens/home/home_page.dart';
import 'package:safe_area/Screens/session/session_page.dart';
import 'package:flutter/scheduler.dart';
import 'package:safe_area/setting/theme/themes.dart';

void main() => runApp(GetMaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isLight = MediaQuery.of(context).platformBrightness != Brightness.dark ? false : true;
    print(isLight);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isLight ? ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black) : THEMES.lightMod,
      title: 'Material App',
      home: Scaffold(body: HomePage()),
    );
  }
}
