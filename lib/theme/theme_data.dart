import 'package:dex_course/theme/colors_collection.dart';
import 'package:flutter/material.dart';

final themeData = ThemeData(
  useMaterial3: true,
  tabBarTheme: const TabBarTheme(
    indicatorColor: ColorsCollection.primary,
    labelStyle: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      height: 14 / 20,
      letterSpacing: .1,
    ),
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: ColorsCollection.primary,
    onPrimary: ColorsCollection.onPrimary,
    secondary: ColorsCollection.secondary,
    onSecondary: ColorsCollection.onSecondary,
    error: ColorsCollection.error,
    onError: ColorsCollection.onError,
    background: ColorsCollection.background,
    onBackground: ColorsCollection.onBackground,
    surface: ColorsCollection.surface,
    onSurface: ColorsCollection.onSurface,
    outline: ColorsCollection.outline,
    onSurfaceVariant: ColorsCollection.onSurfaceVariant,
    outlineVariant: ColorsCollection.outlineVariant,
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    dragHandleColor: ColorsCollection.outline,
    backgroundColor: ColorsCollection.surfaceContainerLow,
  ),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
    padding: EdgeInsets.zero,
  )),
  dividerColor: ColorsCollection.outlineVariant,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        height: 64 / 57,
        letterSpacing: -.25),
    displayMedium: TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.w400,
      height: 52 / 45,
    ),
    displaySmall: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w400,
      height: 44 / 36,
    ),
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w500,
      height: 40 / 32,
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w500,
      height: 36 / 28,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      height: 32 / 24,
    ),
    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      height: 28 / 22,
    ),
    titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 24 / 16,
        letterSpacing: .15),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 20 / 14,
      letterSpacing: .1,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 20 / 14,
      letterSpacing: .1,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 16 / 12,
      letterSpacing: .5,
    ),
    labelSmall: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      height: 16 / 11,
      letterSpacing: .5,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 24 / 16,
      letterSpacing: .5,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 20 / 14,
      letterSpacing: .25,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 16 / 12,
      letterSpacing: .4,
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: ColorsCollection.primary,
  ),
);
