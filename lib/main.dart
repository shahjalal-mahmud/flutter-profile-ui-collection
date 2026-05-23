import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'presentation/screens/instagram_profile_screen.dart';

void main() {
  runApp(const InstagramProfileApp());
}

/// Root application widget.
/// Uses [ThemeMode.system] to follow the device's light/dark preference.
class InstagramProfileApp extends StatelessWidget {
  const InstagramProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Profile',
      debugShowCheckedModeBanner: false,

      // ---- Light theme ----
      theme: AppTheme.light,

      // ---- Dark theme ----
      darkTheme: AppTheme.dark,

      // ---- Follow system preference automatically ----
      themeMode: ThemeMode.system,

      home: const InstagramProfileScreen(),
    );
  }
}