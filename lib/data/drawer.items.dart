import 'package:easygpt/models/drawer.model.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';

class DrawerItems {
  static const newChat = DrawerModel(
    title: "New Chat",
    icon: IconlyLight.paper_plus,
  );

  static const openaiToken = DrawerModel(
    title: "OpenAI Token",
    icon: Ionicons.ticket_outline,
  );

  static final List<DrawerModel> all = [
    newChat,
    openaiToken,
  ];
}
