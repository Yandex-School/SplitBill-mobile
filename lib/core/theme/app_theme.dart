import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  // Светлая тема
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    primaryColor: AppColors.primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      titleTextStyle: TextStyle(
        color: AppColors.lightText,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: AppColors.lightText),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.lightText,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.lightText),
      bodyMedium: TextStyle(color: AppColors.lightSubText),
    ),
    cardColor: Colors.white,
    iconTheme: const IconThemeData(color: AppColors.lightText),
  );

  // Тёмная тема
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    primaryColor: AppColors.primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      titleTextStyle: TextStyle(
        color: AppColors.darkText,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: AppColors.darkText),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.darkText,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.darkText),
      bodyMedium: TextStyle(color: AppColors.darkSubText),
    ),
    cardColor: const Color(0xff1f1f1f),
    iconTheme: const IconThemeData(color: AppColors.darkText),
  );

  // Добавляем методы для получения стилей текста
  static TextStyle paymentTextStyle(BuildContext context) {
    final theme = Theme.of(context);
    return TextStyle(
      color: theme.textTheme.bodyLarge?.color,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
  }

  static TextStyle paymentSubTextStyle(BuildContext context) {
    final theme = Theme.of(context);
    return TextStyle(
      color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7) ?? Colors.white70,
      fontWeight: FontWeight.normal,
    );
  }
}
