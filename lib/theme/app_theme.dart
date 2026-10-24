import 'package:flutter/material.dart';

class AppTheme {
  // PACE Brand Palette
  static const Color primaryBlue = Color(0xFF2555FF);
  static const Color darkSlate = Color(0xFF0F172A);
  static const Color lightBackground = Color(0xFFF8FAFC);
  static const Color cardBg = Color(0xFFF1F5F9);
  static const Color borderGrey = Color(0xFFE2E8F0);
  static const Color textMuted = Color(0xFF64748B);

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryBlue,
      primary: primaryBlue,
      secondary: darkSlate,
      surface: lightBackground,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: darkSlate,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        color: darkSlate,
        letterSpacing: 0.5,
      ),
      iconTheme: IconThemeData(color: darkSlate),
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: borderGrey, width: 1),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.3,
        ),
      ),
    ),
  );
}
