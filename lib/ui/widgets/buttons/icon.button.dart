// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:easygpt/ui/extensions/darkmode.extension.dart';
import 'package:flutter/material.dart';

class EasyGPTIconButton extends StatelessWidget {
  final IconData icon;
  late VoidCallback? onPressed;

  EasyGPTIconButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 20.0),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              width: 1,
              color: !context.isDarkMode
                  ? const Color(0xffF1F1F1).withOpacity(0.5)
                  : const Color(0xffF1F1F1).withOpacity(0.1),
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(50),
            hoverColor: Colors.black.withOpacity(0.01),
            splashColor: Colors.black.withOpacity(0.01),
            focusColor: Colors.black.withOpacity(0.01),
            highlightColor: Colors.black.withOpacity(0.01),
            onTap: onPressed,
            child: Icon(
              icon,
              color: !context.isDarkMode ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
