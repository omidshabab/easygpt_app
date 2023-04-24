class FontFamily {
  static const String en = "Urbanist";
  static const String fa = "Estedad";

  static String getFontFamily(String languageCode) {
    switch (languageCode) {
      case "en":
        return en;
      case "fa":
        return fa;
      default:
        return en;
    }
  }
}
