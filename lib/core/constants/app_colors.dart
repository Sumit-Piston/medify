import 'package:flutter/material.dart';

/// App color constants with teal as primary color and green as secondary
class AppColors {
  AppColors._();

  // Primary - Teal shades
  static const Color primaryLight = Color(0xFF4DB6AC); // Light teal
  static const Color primary = Color(0xFF009688); // Teal
  static const Color primaryDark = Color(0xFF00695C); // Deep teal

  // Secondary - Green shades
  static const Color secondaryLight = Color(0xFF81C784); // Light green
  static const Color secondary = Color(0xFF4CAF50); // Green
  static const Color secondaryDark = Color(0xFF388E3C); // Dark green

  // Status colors
  static const Color success = Color(0xFF4CAF50); // Green for taken
  static const Color warning = Color(0xFFFFA726); // Orange for pending
  static const Color error = Color(0xFFEF5350); // Soft red for missed
  static const Color info = Color(0xFF42A5F5); // Blue for info

  // Background colors - Light mode
  static const Color backgroundLight = Color(0xFFF5F5F5); // Light grey
  static const Color surfaceLight = Color(0xFFFFFFFF); // White
  static const Color cardLight = Color(0xFFFFFFFF); // White

  // Background colors - Dark mode
  static const Color backgroundDark = Color(0xFF121212); // Dark grey
  static const Color surfaceDark = Color(0xFF1E1E1E); // Darker grey
  static const Color cardDark = Color(0xFF2C2C2C); // Card dark

  // Text colors - Light mode
  static const Color textPrimaryLight = Color(0xFF212121);
  static const Color textSecondaryLight = Color(0xFF757575);
  static const Color textDisabledLight = Color(0xFFBDBDBD);

  // Text colors - Dark mode
  static const Color textPrimaryDark = Color(0xFFFFFFFF);
  static const Color textSecondaryDark = Color(0xFFB0B0B0);
  static const Color textDisabledDark = Color(0xFF616161);

  // Border colors
  static const Color borderLight = Color(0xFFE0E0E0);
  static const Color borderDark = Color(0xFF424242);

  // Shadow colors
  static const Color shadowLight = Color(0x1A000000);
  static const Color shadowDark = Color(0x40000000);
}

