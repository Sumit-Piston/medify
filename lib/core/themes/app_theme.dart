import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

/// App theme configuration with Nunito font family
class AppTheme {
  AppTheme._();

  /// Light theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      // Color scheme
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        primaryContainer: AppColors.primaryLight,
        secondary: AppColors.secondary,
        secondaryContainer: AppColors.secondaryLight,
        surface: AppColors.surfaceLight,
        error: AppColors.error,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: AppColors.textPrimaryLight,
        onError: Colors.white,
      ),

      // Scaffold background
      scaffoldBackgroundColor: AppColors.backgroundLight,

      // App bar theme
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        titleTextStyle: GoogleFonts.nunito(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),

      // Card theme (Border Radius: 16px per spec)
      cardTheme: CardThemeData(
        elevation: AppSizes.elevationS,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusCard),
        ),
        color: AppColors.cardLight,
      ),

      // Text theme with Nunito font (following spec)
      // H1: 28px Bold, H2: 24px SemiBold, H3: 20px SemiBold
      // Body Large: 18px, Body Medium: 16px, Body Small: 14px, Caption: 12px
      textTheme: GoogleFonts.nunitoTextTheme().copyWith(
        // H1: 28px, Nunito Bold (Page titles)
        displayLarge: GoogleFonts.nunito(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryLight,
        ),
        // H2: 24px, Nunito SemiBold (Section headers)
        displayMedium: GoogleFonts.nunito(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryLight,
        ),
        // H3: 20px, Nunito SemiBold (Card titles)
        displaySmall: GoogleFonts.nunito(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryLight,
        ),
        headlineMedium: GoogleFonts.nunito(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryLight,
        ),
        titleLarge: GoogleFonts.nunito(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryLight,
        ),
        titleMedium: GoogleFonts.nunito(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryLight,
        ),
        // Body Large: 18px (Important text)
        bodyLarge: GoogleFonts.nunito(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: AppColors.textPrimaryLight,
        ),
        // Body Medium: 16px (Primary content)
        bodyMedium: GoogleFonts.nunito(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.textPrimaryLight,
        ),
        // Body Small: 14px (Secondary text)
        bodySmall: GoogleFonts.nunito(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.textSecondaryLight,
        ),
        // Caption: 12px (Labels, hints)
        labelSmall: GoogleFonts.nunito(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: AppColors.textSecondaryLight,
        ),
        labelLarge: GoogleFonts.nunito(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),

      // Button themes (Border Radius: 12px per spec)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: AppSizes.elevationS,
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          minimumSize: const Size(
            AppSizes.buttonMinWidth,
            AppSizes.buttonHeight,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusButton),
          ),
          textStyle: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          minimumSize: const Size(
            AppSizes.buttonMinWidth,
            AppSizes.buttonHeight,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusButton),
          ),
          side: const BorderSide(color: AppColors.primary, width: 2),
          textStyle: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          minimumSize: const Size(
            AppSizes.buttonMinWidth,
            AppSizes.buttonHeight,
          ),
          textStyle: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Input decoration theme (Border Radius: 8px per spec)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceLight,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingM,
          vertical: AppSizes.paddingM,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusInput),
          borderSide: const BorderSide(color: AppColors.borderLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusInput),
          borderSide: const BorderSide(color: AppColors.borderLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusInput),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusInput),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        labelStyle: GoogleFonts.nunito(
          fontSize: 16,
          color: AppColors.textSecondaryLight,
        ),
        hintStyle: GoogleFonts.nunito(
          fontSize: 16,
          color: AppColors.textDisabledLight,
        ),
      ),

      // Floating action button theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: AppSizes.elevationM,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusL),
        ),
      ),

      // Icon theme
      iconTheme: const IconThemeData(
        color: AppColors.textPrimaryLight,
        size: AppSizes.iconM,
      ),
    );
  }

  /// Dark theme
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      // Color scheme
      colorScheme: ColorScheme.dark(
        primary: AppColors.primaryLight,
        primaryContainer: AppColors.primaryDark,
        secondary: AppColors.secondaryLight,
        secondaryContainer: AppColors.secondaryDark,
        surface: AppColors.surfaceDark,
        error: AppColors.error,
        onPrimary: Colors.black,
        onSecondary: Colors.black,
        onSurface: AppColors.textPrimaryDark,
        onError: Colors.white,
      ),

      // Scaffold background
      scaffoldBackgroundColor: AppColors.backgroundDark,

      // App bar theme
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.surfaceDark,
        foregroundColor: AppColors.textPrimaryDark,
        titleTextStyle: GoogleFonts.nunito(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryDark,
        ),
      ),

      // Card theme (Border Radius: 16px per spec)
      cardTheme: CardThemeData(
        elevation: AppSizes.elevationS,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusCard),
        ),
        color: AppColors.cardDark,
      ),

      // Text theme with Nunito font (following spec)
      textTheme: GoogleFonts.nunitoTextTheme(ThemeData.dark().textTheme)
          .copyWith(
            // H1: 28px, Nunito Bold (Page titles)
            displayLarge: GoogleFonts.nunito(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimaryDark,
            ),
            // H2: 24px, Nunito SemiBold (Section headers)
            displayMedium: GoogleFonts.nunito(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimaryDark,
            ),
            // H3: 20px, Nunito SemiBold (Card titles)
            displaySmall: GoogleFonts.nunito(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimaryDark,
            ),
            headlineMedium: GoogleFonts.nunito(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimaryDark,
            ),
            titleLarge: GoogleFonts.nunito(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimaryDark,
            ),
            titleMedium: GoogleFonts.nunito(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimaryDark,
            ),
            // Body Large: 18px (Important text)
            bodyLarge: GoogleFonts.nunito(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: AppColors.textPrimaryDark,
            ),
            // Body Medium: 16px (Primary content)
            bodyMedium: GoogleFonts.nunito(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: AppColors.textPrimaryDark,
            ),
            // Body Small: 14px (Secondary text)
            bodySmall: GoogleFonts.nunito(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: AppColors.textSecondaryDark,
            ),
            // Caption: 12px (Labels, hints)
            labelSmall: GoogleFonts.nunito(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: AppColors.textSecondaryDark,
            ),
            labelLarge: GoogleFonts.nunito(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),

      // Button themes (Border Radius: 12px per spec)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: AppSizes.elevationS,
          backgroundColor: AppColors.primaryLight,
          foregroundColor: Colors.black,
          minimumSize: const Size(
            AppSizes.buttonMinWidth,
            AppSizes.buttonHeight,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusButton),
          ),
          textStyle: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryLight,
          minimumSize: const Size(
            AppSizes.buttonMinWidth,
            AppSizes.buttonHeight,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusButton),
          ),
          side: const BorderSide(color: AppColors.primaryLight, width: 2),
          textStyle: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryLight,
          minimumSize: const Size(
            AppSizes.buttonMinWidth,
            AppSizes.buttonHeight,
          ),
          textStyle: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Input decoration theme (Border Radius: 8px per spec)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceDark,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingM,
          vertical: AppSizes.paddingM,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusInput),
          borderSide: const BorderSide(color: AppColors.borderDark),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusInput),
          borderSide: const BorderSide(color: AppColors.borderDark),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusInput),
          borderSide: const BorderSide(color: AppColors.primaryLight, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusInput),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        labelStyle: GoogleFonts.nunito(
          fontSize: 16,
          color: AppColors.textSecondaryDark,
        ),
        hintStyle: GoogleFonts.nunito(
          fontSize: 16,
          color: AppColors.textDisabledDark,
        ),
      ),

      // Floating action button theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryLight,
        foregroundColor: Colors.black,
        elevation: AppSizes.elevationM,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusL),
        ),
      ),

      // Icon theme
      iconTheme: const IconThemeData(
        color: AppColors.textPrimaryDark,
        size: AppSizes.iconM,
      ),
    );
  }
}
