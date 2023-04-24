// ignore_for_file: must_be_immutable

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:easygpt/constants/routes.dart';
import 'package:easygpt/ui/widgets/appbar/appbar.dart';
import 'package:easygpt/ui/widgets/buttons/text.button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';

class SoonView extends GetView {
  const SoonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: EasyGPTAppbar(
          title: "soon".tr.capitalize,
          rightIcon: Ionicons.reorder_two,
          rightIconOnPressed: () {
            //
          },
          leftIcon: IconlyLight.arrow_left,
          leftIconOnPressed: () {
            Get.back();
          },
        ),
      ),
      body: Center(
        child: Container(
          width: 325,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/svg/hand_shake.svg",
                width: 250,
              ),
              const SizedBox(height: 25),
              Text(
                "soonPageDescription".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: !context.isDarkMode ? Colors.black : Colors.white,
                ),
              ),
              SizedBox(height: 15),
              Container(
                constraints: BoxConstraints(maxWidth: 250),
                child: ButtonBarSuper(
                  lineSpacing: 15,
                  wrapType: WrapType.balanced,
                  wrapFit: WrapFit.divided,
                  children: [
                    EasyGPTTextButton(
                      title: "home".tr,
                      onPressed: () {
                        Get.offAllNamed(Routes.home);
                      },
                    ),
                    EasyGPTTextButton(
                      title: "previousPage".tr,
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
