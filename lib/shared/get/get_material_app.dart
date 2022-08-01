import 'package:flutter/material.dart';

class GetMaterialApp extends MaterialApp {
  final String title;
  final GlobalKey<NavigatorState>? navigatorKey;
  final ThemeData? theme;
  final Widget home;

  GetMaterialApp({
    this.title = '',
    this.navigatorKey,
    this.theme,
    required this.home,
  }) {}
}
