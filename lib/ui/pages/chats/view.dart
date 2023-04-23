import 'package:easygpt/ui/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: EasyGPTAppbar(
          title: "appName".tr,
          leftIcon: Ionicons.reorder_two,
          leftIconOnPressed: () {
            //
          },
          rightIcon: Ionicons.add,
          rightIconOnPressed: () {
            //
          },
        ),
      ),
      body: Center(
        child: Text(
          "سلام",
        ),
      ),
    );
  }
}
