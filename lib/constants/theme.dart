import 'package:easygpt/constants/config.dart';
import 'package:easygpt/utilities/fontfamily.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData(
    fontFamily: FontFamily.getFontFamily(Config.myLocale.languageCode),
    primaryColor: !context.isDarkMode ? Colors.black : Colors.white,
    appBarTheme: appBarTheme,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
      primary: !context.isDarkMode ? Colors.black : Colors.white,
      background: !context.isDarkMode ? Colors.black : Colors.white,
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData(
    fontFamily: FontFamily.getFontFamily(Config.myLocale.languageCode),
    primaryColor: !context.isDarkMode ? Colors.black : Colors.white,
    appBarTheme: appBarTheme,
    scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
      ),
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: !context.isDarkMode ? Colors.black : Colors.white,
      background: !context.isDarkMode ? Colors.black : Colors.white,
    ),
  );
}

var appBarTheme = AppBarTheme(
  elevation: 0,
  toolbarHeight: 65,
  centerTitle: true,
  titleTextStyle: TextStyle(
    fontFamily: FontFamily.getFontFamily(Config.myLocale.languageCode),
    fontWeight: FontWeight.bold,
  ),
);
