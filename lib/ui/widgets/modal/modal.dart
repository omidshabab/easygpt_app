// ignore_for_file: non_constant_identifier_names

import 'dart:ui';

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

EasyGPTModal(Widget child, BuildContext context,
    {bool willPopScope = true}) async {
  return showModalBottomSheet(
    elevation: 0,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => willPopScope,
        child: StatefulBuilder(
          builder: (BuildContext context, setState) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: GestureDetector(
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                child: Wrap(
                  children: [
                    ClipRRect(
                      borderRadius: const SmoothBorderRadius.only(
                        topLeft: SmoothRadius(
                          cornerRadius: 30,
                          cornerSmoothing: 2,
                        ),
                        topRight: SmoothRadius(
                          cornerRadius: 30,
                          cornerSmoothing: 2,
                        ),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(top: 20, bottom: 40),
                          decoration: BoxDecoration(
                            color: !context.isDarkMode
                                ? Colors.white
                                : Colors.black.withOpacity(0.6),
                            borderRadius: const SmoothBorderRadius.only(
                              topLeft: SmoothRadius(
                                cornerRadius: 30,
                                cornerSmoothing: 2,
                              ),
                              topRight: SmoothRadius(
                                cornerRadius: 30,
                                cornerSmoothing: 2,
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.15),
                                spreadRadius: 30,
                                blurRadius: 15,
                                offset: const Offset(0, 15),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 40,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: !context.isDarkMode
                                      ? Colors.black.withOpacity(0.1)
                                      : const Color(0xffF1F1F1)
                                          .withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              const SizedBox(height: 15),
                              child,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
