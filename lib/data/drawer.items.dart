import 'package:easygpt/models/drawer.model.dart';
import 'package:iconly/iconly.dart';

class DrawerItems {
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
    home,
    explore,
    messages,
    profile,
    settings,
    logout,
  ];
}
