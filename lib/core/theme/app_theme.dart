import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/app_colors.dart';

/// Centralized theme configuration.
/// Provides light and dark ThemeData matching Instagram's exact look.
class AppTheme {
  AppTheme._();

  // ------------------------------------------------------------------ DARK --
  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBackground,
      colorScheme: const ColorScheme.dark(
        surface: AppColors.darkBackground,
        onSurface: AppColors.darkText,
        primary: AppColors.darkText,
        secondary: AppColors.darkSecondaryText,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkBackground,
        foregroundColor: AppColors.darkIconColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.darkDivider,
        thickness: 0.5,
        space: 0,
      ),
      iconTheme: const IconThemeData(color: AppColors.darkIconColor),
      textTheme: _buildTextTheme(AppColors.darkText, AppColors.darkSecondaryText),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkNavBarBg,
        selectedItemColor: AppColors.darkText,
        unselectedItemColor: AppColors.darkSecondaryText,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  // ----------------------------------------------------------------- LIGHT --
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightBackground,
      colorScheme: const ColorScheme.light(
        surface: AppColors.lightBackground,
        onSurface: AppColors.lightText,
        primary: AppColors.lightText,
        secondary: AppColors.lightSecondaryText,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.lightBackground,
        foregroundColor: AppColors.lightIconColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.lightDivider,
        thickness: 0.5,
        space: 0,
      ),
      iconTheme: const IconThemeData(color: AppColors.lightIconColor),
      textTheme: _buildTextTheme(AppColors.lightText, AppColors.lightSecondaryText),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.lightNavBarBg,
        selectedItemColor: AppColors.lightText,
        unselectedItemColor: AppColors.lightSecondaryText,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  // -------------------------------------------------------- SHARED HELPERS --
  static TextTheme _buildTextTheme(Color primary, Color secondary) {
    return TextTheme(
      // Display name
      titleMedium: TextStyle(
        color: primary,
        fontWeight: FontWeight.w700,
        fontSize: 15,
        letterSpacing: 0,
      ),
      // Bio, chips, general body
      bodyMedium: TextStyle(
        color: primary,
        fontSize: 14,
        height: 1.4,
      ),
      // Labels, secondary info
      bodySmall: TextStyle(
        color: secondary,
        fontSize: 13,
      ),
      // Stats numbers
      headlineSmall: TextStyle(
        color: primary,
        fontWeight: FontWeight.w700,
        fontSize: 18,
      ),
    );
  }
}