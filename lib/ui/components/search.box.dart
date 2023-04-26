import 'dart:ui';

import 'package:easygpt/ui/widgets/textfield/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 20.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
          child: EasyGPTTextField(
            onChanged: (value) {
              // searchCoupons(searchController.text);
            },
            // textfieldController: searchController,
            hintText: "searchField".tr,
            maxLines: 1,
            prefixIcon: IconlyLight.search,
            prefixIconOnPressed: () {},
            suffixIcon: IconlyLight.filter,
            suffixIconOnPressed: () {
              //
            },
            obscureText: false,
          ),
        ),
      ),
    );
  }
}
