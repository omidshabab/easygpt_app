import 'package:get/get.dart';

class FontFamily {
  static const String en = "Urbanist";
  static const String fa = "Rokh";

  static String getFontFamily() {
    switch (Get.deviceLocale.toString()) {
      case "en":
        return en;
      case "fa":
        return fa;
      default:
        return en;
    }
  }
}
