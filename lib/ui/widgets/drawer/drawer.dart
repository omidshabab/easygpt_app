import 'package:easygpt/data/drawer.items.dart';
import 'package:easygpt/models/drawer.model.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';

class EasyGPTDrawer extends StatelessWidget {
  final ValueChanged<DrawerModel> onSelectedItem;

  const EasyGPTDrawer({
    super.key,
    required this.onSelectedItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 32, 16, 52),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: !context.isDarkMode
                          ? Colors.black.withOpacity(0.05)
                          : Colors.white.withOpacity(0.01),
                    ),
                    borderRadius: SmoothBorderRadius(
                      cornerRadius: 15,
                      cornerSmoothing: 0.5,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: SmoothBorderRadius(
                      cornerRadius: 15,
                      cornerSmoothing: 0.5,
                    ),
                    child: ListTile(
                      splashColor: Colors.black.withOpacity(0.01),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      minVerticalPadding: 0,
                      minLeadingWidth: 0,
                      leading: Icon(IconlyLight.chat),
                      title: Text(
                        "App Name",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "Urbanist",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {
                        //
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            width: MediaQuery.of(context).size.width,
            height: 1,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.05),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          buildDrawerItems(context),
        ],
      ),
    );
  }

  Widget buildDrawerItems(BuildContext context) {
    return Column(
      children: [
        Column(
          children: DrawerItems.all
              .map(
                (item) => Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: !context.isDarkMode
                          ? Colors.black.withOpacity(0.05)
                          : Colors.white.withOpacity(0.01),
                    ),
                    borderRadius: SmoothBorderRadius(
                      cornerRadius: 15,
                      cornerSmoothing: 0.5,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: SmoothBorderRadius(
                      cornerRadius: 15,
                      cornerSmoothing: 0.5,
                    ),
                    child: ListTile(
                      splashColor: Colors.black.withOpacity(0.01),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      minVerticalPadding: 0,
                      minLeadingWidth: 0,
                      leading: Icon(item.icon),
                      title: Text(
                        item.title,
                        style: TextStyle(
                          fontFamily: "Urbanist",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () => onSelectedItem(item),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
