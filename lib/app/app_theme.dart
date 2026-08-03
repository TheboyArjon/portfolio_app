import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: const Color(0xFF2196F3),
    scaffoldBackgroundColor: const Color(0xFFF7F9FC),
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: const Color(0xFF2196F3),
    scaffoldBackgroundColor: const Color(0xFF0D1520),
  );
}
