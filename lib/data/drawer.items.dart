import 'package:easygpt/models/drawer.model.dart';
import 'package:iconly/iconly.dart';

class DrawerItems {
  static const newChat = DrawerModel(
    title: "New Chat",
    icon: IconlyLight.paper_plus,
  );

  static const about = DrawerModel(
    title: "profile",
    icon: IconlyLight.profile,
  );

  static const settings = DrawerModel(
    title: "settings",
    icon: IconlyLight.setting,
  );

  static final List<DrawerModel> all = [
    newChat,
    about,
    settings,
  ];
}
