import 'package:flutter/material.dart';
import 'package:clientes_manager/view/theme/my_colors.dart';

ThemeData themeData = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: themeColors["primary"],
  primaryColorLight: themeColors["primaryDark"],
  primaryColorDark: themeColors["primaryLight"],
  canvasColor: themeColors["canvasColor"],
  cardColor: themeColors["card"],
  dividerColor: themeColors["divider"],
  shadowColor: themeColors["shadowColor"],
  scaffoldBackgroundColor: themeColors["background"],
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: themeColors["primary"]!,
    onPrimary: themeColors["onPrimary"]!,
    secondary: themeColors["secondary"]!,
    onSecondary: themeColors["onSecondary"]!,
    error: themeColors["error"]!,
    onError: themeColors["onError"]!,
    surface: themeColors["surface"]!,
    onSurface: themeColors["onSurface"]!,
  ),
  appBarTheme: AppBarTheme(color: themeColors["appBarBackground"]),
  //FloatingActionButtonTheme
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: themeColors["primary"],
  ),
  //IconTheme
  iconTheme: IconThemeData(color: themeColors["onPrimary"], size: 24),
);
