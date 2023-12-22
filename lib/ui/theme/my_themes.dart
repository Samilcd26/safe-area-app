import 'package:flutter/material.dart';
import 'package:safe_area/ui/theme/constants.dart';

class MyAppThemes {
  static final lightTheme = ThemeData(
    primaryColor: COLORS.lightBlue,
    brightness: Brightness.light,
  );

  static final darkTheme = ThemeData(
    primaryColor: COLORS.darkBlue,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
  );
}
