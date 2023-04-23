// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:easygpt/ui/widgets/buttons/icon.button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EasyGPTAppbar extends StatelessWidget {
  String? title;
  VoidCallback? titleOnTap;
  IconData? leftIcon;
  VoidCallback? leftIconOnPressed;
  IconData? rightIcon;
  VoidCallback? rightIconOnPressed;

  EasyGPTAppbar({
    super.key,
    this.title,
    this.titleOnTap,
    this.leftIcon,
    this.leftIconOnPressed,
    this.rightIcon,
    this.rightIconOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 65.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: !context.isDarkMode
                      ? const Color(0xffF1F1F1).withOpacity(0.5)
                      : const Color(0xffF1F1F1).withOpacity(0.1),
                ),
              ),
            ),
            child: AppBar(
              backgroundColor: !context.isDarkMode
                  ? Colors.white.withOpacity(0.6)
                  : Colors.black.withOpacity(0.6),
              leadingWidth: 50,
              leading: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: EasyGPTIconButton(
                    onPressed: rightIconOnPressed!,
                    icon: rightIcon!,
                  ),
                ),
              ),
              title: GestureDetector(
                onTap: titleOnTap,
                child: Text(
                  title!.tr,
                  style: TextStyle(
                    fontSize: 18,
                    color: !context.isDarkMode ? Colors.black : Colors.white,
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: EasyGPTIconButton(
                    onPressed: leftIconOnPressed!,
                    icon: leftIcon!,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
