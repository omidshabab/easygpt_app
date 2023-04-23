import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Config {
  Config._();

  static GetStorage box = GetStorage();

  static bool lightMode = false;
  static bool darkMode = false;
  static bool defaultMode = false;

  static Locale myLocale = window.locale;

  static getThemeStatus() {
    switch (Config.box.read("themeStatus")) {
      case "defaultMode":
        Config.defaultMode = true;
        Config.lightMode = false;
        Config.darkMode = false;
        return ThemeMode.system;
      case "lightMode":
        Config.defaultMode = false;
        Config.lightMode = true;
        Config.darkMode = false;
        return ThemeMode.light;
      case "darkMode":
        Config.defaultMode = false;
        Config.lightMode = false;
        Config.darkMode = true;
        return ThemeMode.dark;
      default:
        Config.defaultMode = true;
        Config.lightMode = false;
        Config.darkMode = false;
        return ThemeMode.system;
    }
  }
}
