import 'package:easygpt/data/drawer.items.dart';
import 'package:easygpt/models/drawer.model.dart';
import 'package:easygpt/ui/pages/soon/view.dart';
import 'package:easygpt/ui/widgets/drawer/drawer.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late double xOffset;
  late double yOffset;
  late double scaleFactor;
  late bool isDrawOpen;
  DrawerModel item = DrawerItems.newChat;
  bool isDragging = false;

  @override
  void initState() {
    super.initState();

    closeDrawer();
  }

  void closeDrawer() {
    setState(() {
      xOffset = 0;
      yOffset = 0;
      scaleFactor = 1;
      isDrawOpen = false;
    });
  }

  void openDrawer() {
    setState(() {
      xOffset = 250;
      yOffset = 100;
      scaleFactor = 0.8;
      isDrawOpen = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
          children: [
            buildDrawer(),
            buildPage(),
          ],
        ),
      ),
    );
  }

  Widget buildDrawer() {
    return SafeArea(
      child: Container(
        width: xOffset,
        constraints: BoxConstraints(maxWidth: 350),
        child: EasyGPTDrawer(
          onSelectedItem: (item) {
            switch (item) {
              case DrawerItems.settings:
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Setting",
                    ),
                  ),
                );
                return;
              default:
                setState(() => this.item = item);
                closeDrawer();
            }
          },
        ),
      ),
    );
  }

  Widget buildPage() {
    return WillPopScope(
      onWillPop: () async {
        if (isDrawOpen) {
          closeDrawer();

          return false;
        } else {
          return true;
        }
      },
      child: GestureDetector(
        onTap: closeDrawer,
        onHorizontalDragStart: (details) => isDragging = true,
        onHorizontalDragUpdate: (details) {
          if (!isDragging) return;

          const delta = 1;
          if (details.delta.dx > delta) {
            openDrawer();
          } else if (details.delta.dx < -delta) {
            closeDrawer();
          }

          isDragging = false;
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 250),
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(scaleFactor),
          child: AbsorbPointer(
            absorbing: isDrawOpen,
            child: ClipRRect(
              borderRadius: SmoothBorderRadius(
                cornerRadius: isDrawOpen ? 50 : 0,
                cornerSmoothing: 0.5,
              ),
              child: Container(
                color: isDrawOpen ? Colors.white38 : Colors.white,
                child: getDrawerPage(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getDrawerPage() {
    switch (item) {
      case DrawerItems.about:
        return HomeView();
      case DrawerItems.newChat:
      default:
        return SoonView(openDrawer: openDrawer);
    }
  }
}
