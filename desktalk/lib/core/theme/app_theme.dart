import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  // Light theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.primary, foregroundColor: AppColors.textDark),
    textTheme: const TextTheme(bodyMedium: TextStyle(color: AppColors.textDark)),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      hintStyle: TextStyle(color: Colors.grey),
    ),
    iconTheme: const IconThemeData(color: AppColors.textDark),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: AppColors.textLight),
    ),
  );

  // Dark theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.secondary, foregroundColor: AppColors.textLight),
    textTheme: const TextTheme(bodyMedium: TextStyle(color: AppColors.textLight)),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      hintStyle: TextStyle(color: Colors.grey),
    ),
    iconTheme: const IconThemeData(color: AppColors.textLight),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: AppColors.textLight),
    ),
  );
}
