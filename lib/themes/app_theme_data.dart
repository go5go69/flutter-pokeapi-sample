import 'package:flutter/material.dart';
import 'package:poke_match/constants/app_sizes.dart';
import 'package:poke_match/themes/app_text_themes.dart';

class AppThemeData {
  final bool isDarkMode;

  AppThemeData.light() : isDarkMode = false;
  AppThemeData.dark() : isDarkMode = true;

  ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        seedColor: Colors.blue,
      ),
      textTheme: appTextTheme,

      splashColor: Colors.transparent,

      // textField
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(Sizes.p8),
        ),
      ),

      // bottomNavigation
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(
          size: Sizes.p32,
          color: Colors.blueAccent,
        ),
        unselectedIconTheme: IconThemeData(size: Sizes.p32),
      ),
    );
  }
}
