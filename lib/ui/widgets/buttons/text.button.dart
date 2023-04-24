// ignore_for_file: must_be_immutable

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EasyGPTTextButton extends StatelessWidget {
  final String title;
  bool? isLoading = true;
  bool? backgroundColor = false;
  bool? isActive;
  VoidCallback? onPressed;

  EasyGPTTextButton({
    super.key,
    required this.title,
    this.isLoading,
    this.backgroundColor,
    this.isActive = true,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: !context.isDarkMode
          ? backgroundColor != true
              ? BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: !context.isDarkMode
                        ? Colors.black.withOpacity(0.03)
                        : Colors.white.withOpacity(0.05),
                  ),
                  borderRadius: SmoothBorderRadius(
                    cornerRadius: 10,
                    cornerSmoothing: 0.5,
                  ),
                )
              : ShapeDecoration(
                  color: Colors.black,
                  shape: SmoothRectangleBorder(
                    borderRadius: SmoothBorderRadius(
                      cornerRadius: 10,
                      cornerSmoothing: 0.5,
                    ),
                  ),
                )
          : backgroundColor != true
              ? ShapeDecoration(
                  color: Colors.transparent,
                  shape: SmoothRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: const Color(0xffF1F1F1).withOpacity(0.1),
                    ),
                    borderRadius: SmoothBorderRadius(
                      cornerRadius: 10,
                      cornerSmoothing: 0.5,
                    ),
                  ),
                )
              : ShapeDecoration(
                  color: Colors.white.withOpacity(0.08),
                  shape: SmoothRectangleBorder(
                    borderRadius: SmoothBorderRadius(
                      cornerRadius: 10,
                      cornerSmoothing: 0.5,
                    ),
                  ),
                ),
      child: TextButton(
        onPressed: isActive != false ? onPressed : null,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            return !context.isDarkMode
                ? Colors.black.withOpacity(0.01)
                : Colors.white.withOpacity(0.03);
          }),
        ),
        child: isLoading != true
            ? Text(
                title.tr.capitalize!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: !context.isDarkMode
                      ? backgroundColor != true
                          ? isActive != true
                              ? Colors.black.withOpacity(0.5)
                              : Colors.black
                          : isActive != true
                              ? Colors.white.withOpacity(0.5)
                              : Colors.white
                      : Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              )
            : SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  color: !context.isDarkMode
                      ? backgroundColor != true
                          ? Colors.black.withOpacity(0.5)
                          : Colors.white
                      : Colors.white,
                  strokeWidth: 1,
                ),
              ),
      ),
    );
  }
}
