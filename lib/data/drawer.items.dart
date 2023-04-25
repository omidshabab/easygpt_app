import 'package:easygpt/models/drawer.model.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';

class DrawerItems {
  static var newChat = DrawerModel(
    title: "new chat".tr,
    icon: IconlyLight.paper_plus,
  );

  static var openaiToken = DrawerModel(
    title: "apiKey".tr,
    icon: Ionicons.ticket_outline,
  );

  static final List<DrawerModel> all = [
    newChat,
    openaiToken,
  ];
}
