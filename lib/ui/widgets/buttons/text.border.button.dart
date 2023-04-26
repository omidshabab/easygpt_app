// ignore_for_file: must_be_immutable

import 'package:easygpt/ui/extensions/darkmode.extension.dart';
import 'package:flutter/material.dart';

class EasyGPTTextBorderButton extends StatelessWidget {
  final String title;
  VoidCallback? onTap;

  EasyGPTTextBorderButton({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      hoverColor: Colors.black.withOpacity(0.01),
      splashColor: Colors.black.withOpacity(0.01),
      focusColor: Colors.black.withOpacity(0.01),
      highlightColor: Colors.black.withOpacity(0.01),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            width: 1,
            color: !context.isDarkMode
                ? const Color(0xffF1F1F1).withOpacity(0.5)
                : const Color(0xffF1F1F1).withOpacity(0.1),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
