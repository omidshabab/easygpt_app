import 'package:easygpt/constants/config.dart';
import 'package:easygpt/constants/routes.dart';
import 'package:easygpt/constants/theme.dart';
import 'package:easygpt/constants/translation.dart';
import 'package:easygpt/ui/pages/home/view.dart';
import 'package:easygpt/ui/pages/soon/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future main() async {
  runApp(const EasyGPT());
}

class EasyGPT extends StatelessWidget {
  const EasyGPT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Easy GPT",
      theme: lightThemeData(context),
      locale: Get.deviceLocale,
      getPages: [
        GetPage(name: Routes.home, page: () => const HomeView()),
        GetPage(name: Routes.soon, page: () => SoonView()),
      ],
      initialRoute: Routes.home,
      unknownRoute: GetPage(name: Routes.soon, page: () => SoonView()),
      translationsKeys: Translation.translationsKeys,
      fallbackLocale: const Locale("fa"),
      defaultTransition: Transition.native,
    );
  }
}
