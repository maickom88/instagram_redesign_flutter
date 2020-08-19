import 'package:flutter/material.dart';

class AppThemeLight {
  ThemeData getTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColorBrightness: Brightness.dark,
      primaryColor: Colors.white,
      secondaryHeaderColor: Colors.black87,
      textSelectionColor: Colors.grey[400],
      accentColor: Colors.white,
    );
  }
}
