import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';
import 'helper/object_box.dart';
import 'package:mycloths/config/app_router.dart';

late ObjectBox objectBox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.create();
  // Getting Theme From Json
  final themeStr = await rootBundle.loadString("assets/appainter_theme.json");
  final themeJson = await jsonDecode(themeStr);
  final themes = ThemeDecoder.decodeThemeData(themeJson);

  runApp(MyApp(
    theme: themes!,
  ));
}

class MyApp extends StatelessWidget {
  final ThemeData theme;
  const MyApp({super.key, required this.theme});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "My Clothss",
      theme: theme,
      routerConfig: MyClothssRouter().router,
    );
  }
}
