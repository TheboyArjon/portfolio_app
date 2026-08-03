import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Centralized color + theme definitions.
/// A blue-gradient identity is used across light & dark modes,
/// which also feeds the color-transition animations in the UI.
class AppColors {
  static const Color primaryBlue = Color(0xFF2563EB);
  static const Color secondaryBlue = Color(0xFF60A5FA);
  static const Color accentCyan = Color(0xFF38BDF8);

  static const List<Color> gradientLight = [
    Color(0xFF3B82F6),
    Color(0xFF06B6D4),
  ];

  static const List<Color> gradientDark = [
    Color(0xFF1E3A8A),
    Color(0xFF0891B2),
  ];

  static const Color lightBg = Color(0xFFF5F8FF);
  static const Color darkBg = Color(0xFF0B1220);
  static const Color lightCard = Colors.white;
  static const Color darkCard = Color(0xFF141B2E);
}

class AppTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBg,
    primaryColor: AppColors.primaryBlue,
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryBlue,
      secondary: AppColors.accentCyan,
      surface: AppColors.lightCard,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(),
    useMaterial3: true,
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBg,
    primaryColor: AppColors.secondaryBlue,
    colorScheme: ColorScheme.dark(
      primary: AppColors.secondaryBlue,
      secondary: AppColors.accentCyan,
      surface: AppColors.darkCard,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
    useMaterial3: true,
  );
}
