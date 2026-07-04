import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData buildUbitTheme() {
  const primary = AppColors.primary;
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      primary: primary,
      surface: AppColors.cardBackground,
    ),
    scaffoldBackgroundColor: AppColors.scaffoldBackground,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.appBarSurface,
      foregroundColor: primary,
      titleTextStyle: TextStyle(
        color: primary,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      iconTheme: IconThemeData(color: primary),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.fieldFill,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: AppColors.onPrimary,
        elevation: 2,
        shadowColor: Colors.black26,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: AppColors.linkBlue),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return primary;
        return null;
      }),
    ),
    tabBarTheme: const TabBarThemeData(
      labelColor: primary,
      unselectedLabelColor: AppColors.textSecondary,
      indicatorColor: primary,
      dividerColor: Colors.transparent,
    ),
  );
}
