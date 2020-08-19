import 'package:flutter/material.dart';

class AppThemeDark {
  ThemeData getTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColorBrightness: Brightness.light,
      primaryColor: Colors.grey[900],
      secondaryHeaderColor: Colors.white,
      textSelectionColor: Colors.white,
      accentColor: Colors.black87,
    );
  }
}
