import 'package:flutter/material.dart';

/// All color constants used throughout the app.
/// Instagram-accurate colors for both light and dark themes.
class AppColors {
  AppColors._();

  // --- Dark Mode Colors ---
  static const Color darkBackground = Color(0xFF000000);
  static const Color darkSurface = Color(0xFF1C1C1E);
  static const Color darkDivider = Color(0xFF262626);
  static const Color darkText = Color(0xFFFFFFFF);
  static const Color darkSecondaryText = Color(0xFF8E8E93);
  static const Color darkButtonBg = Color(0xFF262626);
  static const Color darkIconColor = Color(0xFFFFFFFF);
  static const Color darkTabBarBg = Color(0xFF000000);
  static const Color darkChipBg = Color(0xFF1C1C1E);
  static const Color darkChipBorder = Color(0xFF363636);
  static const Color darkNavBarBg = Color(0xFF000000);
  static const Color darkNavBarBorder = Color(0xFF262626);
  static const Color darkHighlightBorder = Color(0xFF363636);

  // --- Light Mode Colors ---
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightSurface = Color(0xFFF8F8F8);
  static const Color lightDivider = Color(0xFFDBDBDB);
  static const Color lightText = Color(0xFF000000);
  static const Color lightSecondaryText = Color(0xFF737373);
  static const Color lightButtonBg = Color(0xFFEFEFEF);
  static const Color lightIconColor = Color(0xFF000000);
  static const Color lightTabBarBg = Color(0xFFFFFFFF);
  static const Color lightChipBg = Color(0xFFFFFFFF);
  static const Color lightChipBorder = Color(0xFFDBDBDB);
  static const Color lightNavBarBg = Color(0xFFFFFFFF);
  static const Color lightNavBarBorder = Color(0xFFDBDBDB);
  static const Color lightHighlightBorder = Color(0xFFDBDBDB);

  // --- Shared ---
  static const Color activeTabIndicator = Color(0xFFFFFFFF); // dark mode active
  static const Color activeTabIndicatorLight = Color(0xFF000000); // light mode active
  static const Color inactiveTab = Color(0xFF737373);
  static const Color storyRingGradientStart = Color(0xFFF9CE34);
  static const Color storyRingGradientMid = Color(0xFFEE2A7B);
  static const Color storyRingGradientEnd = Color(0xFF6228D7);
  static const Color plusBadgeBg = Color(0xFF0095F6);
  static const Color transparent = Colors.transparent;
}