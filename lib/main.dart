import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_redesign/core/theme/theme_light.dart';
import 'package:instagram_redesign/pages/instagram_home.dart';

import 'core/theme/theme_dark.dart';

void main() {
  runApp(MyApp());
}

class SystemUiOverlayStyle {}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: AppThemeLight().getTheme(),
      home: InstagramHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
