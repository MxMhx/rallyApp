import 'package:flutter/material.dart';

class AppColor {
  static const Color primaryColor = Colors.white;
  static const Color secondaryColor = Colors.black;
  static const Color actionColor = Color(0xFF2C82FE);
}

final ThemeData appTheme = ThemeData(
  primaryColor: AppColor.primaryColor,
  fontFamily: 'Noto Sans Thai',
  textTheme: textTheme(),
);

TextTheme textTheme() {
  return const TextTheme(
    displayLarge: TextStyle(
      color: Colors.white,
      fontSize: 36,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      color: Colors.white,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    headlineLarge: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    bodyLarge: TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: TextStyle(
      color: Colors.white,
      fontSize: 10,
      fontWeight: FontWeight.normal,
    ),
  );
}
