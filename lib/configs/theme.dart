import 'package:flutter/material.dart';

class AppColor {
  static const Color primaryColor = Color.fromARGB(255, 31, 31, 31);
  static const Color secondaryColor = Colors.white;
  static const Color actionColor = Color(0xFF2C82FE);
}

final ThemeData appThemeDark = ThemeData(
  primaryColor: AppColor.primaryColor,
  secondaryHeaderColor: AppColor.secondaryColor,
  fontFamily: 'Noto Sans Thai',
  textTheme: textTheme(Colors.white),
);

final ThemeData appThemeLight = ThemeData(
  primaryColor: AppColor.secondaryColor,
  secondaryHeaderColor: AppColor.primaryColor,
  fontFamily: 'Noto Sans Thai',
  textTheme: textTheme(Colors.black),
);

TextTheme textTheme(Color color) {
  return TextTheme(
    displayLarge: TextStyle(
      color: color,
      fontSize: 36,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      color: color,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(
      color: color,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    headlineLarge: TextStyle(
      color: color,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      color: color,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: TextStyle(
      color: color,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      color: color,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    bodyLarge: TextStyle(
      color: color,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: TextStyle(
      color: color,
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: TextStyle(
      color: color,
      fontSize: 10,
      fontWeight: FontWeight.normal,
    ),
  );
}
