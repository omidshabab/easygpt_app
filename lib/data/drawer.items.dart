import 'package:easygpt/models/drawer.model.dart';
import 'package:iconly/iconly.dart';

class DrawerItems {
  static const newChat = DrawerModel(
    title: "new chat",
    icon: IconlyLight.home,
  );

  static const about = DrawerModel(
    title: "about",
    icon: IconlyLight.home,
  );

  static const home = DrawerModel(
    title: "home",
    icon: IconlyLight.home,
  );

  static const explore = DrawerModel(
    title: "explore",
    icon: IconlyLight.edit,
  );

  static const messages = DrawerModel(
    title: "messages",
    icon: IconlyLight.message,
  );

  static const profile = DrawerModel(
    title: "profile",
    icon: IconlyLight.profile,
  );

  static const settings = DrawerModel(
    title: "settings",
    icon: IconlyLight.setting,
  );

  static const logout = DrawerModel(
    title: "logout",
    icon: IconlyLight.logout,
  );

  static final List<DrawerModel> all = [
    newChat,
    about,
    home,
    explore,
    messages,
    profile,
    settings,
    logout,
  ];
}
