import 'package:easygpt/data/drawer.items.dart';
import 'package:easygpt/models/drawer.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EasyGPTDrawer extends StatelessWidget {
  final ValueChanged<DrawerModel> onSelectedItem;

  const EasyGPTDrawer({
    super.key,
    required this.onSelectedItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 32, 16, 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildDrawerItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildDrawerItems(BuildContext context) {
    return Column(
      children: DrawerItems.all
          .map(
            (item) => ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              leading: Icon(item.icon),
              title: Text(
                item.title.capitalizeFirst!,
                style: TextStyle(
                  fontFamily: "Urbanist",
                ),
              ),
              onTap: () => onSelectedItem(item),
            ),
          )
          .toList(),
    );
  }
}
