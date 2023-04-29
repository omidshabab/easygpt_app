// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:easygpt/services/chatgpt.service.dart';
import 'package:easygpt/ui/pages/chat/chat.get.dart';
import 'package:easygpt/ui/widgets/appbar/appbar.dart';
import 'package:easygpt/ui/widgets/buttons/icon.button.dart';
import 'package:easygpt/ui/widgets/markdown/markdown.dart';
import 'package:easygpt/ui/widgets/textfield/chat.textfield.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';

class ChatsView extends StatelessWidget {
  final chatGet = Get.put(ChatGet());

  VoidCallback? openDrawer;

  ChatsView({
    super.key,
    this.openDrawer,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            SvgPicture.asset(
              "assets/svg/pattern-show-cats.svg",
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                color: !context.isDarkMode
                    ? Colors.white.withOpacity(0.9)
                    : Colors.black.withOpacity(0.9),
              ),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(65),
                child: EasyGPTAppbar(
                  title: "appName".tr,
                  leadingIcon: Ionicons.reorder_two,
                  leadingIconOnPressed: () {
                    openDrawer!();
                  },
                  actionsIcon: Ionicons.add,
                  actionsIconOnPressed: () {
                    //
                  },
                ),
              ),
              body: Column(
                children: [
                  StreamBuilder<bool>(
                    stream: chatGet.onUpdateStream.stream,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (chatGet.messages.isNotEmpty || snapshot.hasData) {
                        return Expanded(
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              ListView(
                                shrinkWrap: true,
                                controller: chatGet.scrollController,
                                physics: ClampingScrollPhysics(),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                children: [
                                  ListView.separated(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    key: PageStorageKey<String>("chats-view"),
                                    itemCount: chatGet.messages.length,
                                    itemBuilder: (context, index) {
                                      final message = chatGet.messages[index];
                                      return Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            borderRadius: SmoothBorderRadius(
                                              cornerRadius: 12,
                                              cornerSmoothing: 0.5,
                                            ),
                                            hoverColor:
                                                Colors.black.withOpacity(0.01),
                                            splashColor:
                                                Colors.black.withOpacity(0.01),
                                            focusColor:
                                                Colors.black.withOpacity(0.01),
                                            highlightColor:
                                                Colors.black.withOpacity(0.01),
                                            onTap: () {
                                              //
                                            },
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: !context.isDarkMode
                                                    ? Colors.black
                                                        .withOpacity(0.03)
                                                    : Colors.white
                                                        .withOpacity(0.05),
                                                borderRadius:
                                                    SmoothBorderRadius(
                                                  cornerRadius: 12,
                                                  cornerSmoothing: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: EasyGPTMarkdown(
                                              data: message.message!,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        SizedBox(height: 20),
                                  ),
                                  if (chatGet.messages.isNotEmpty)
                                    SizedBox(
                                      height: 65,
                                    ),
                                ],
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Expanded(
                          child: Center(
                            child: ClipRRect(
                              borderRadius: SmoothBorderRadius(
                                cornerRadius: 30,
                                cornerSmoothing: 0.5,
                              ),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                    sigmaX: 10.0, sigmaY: 20.0),
                                child: InkWell(
                                  borderRadius: SmoothBorderRadius(
                                    cornerRadius: 30,
                                    cornerSmoothing: 0.5,
                                  ),
                                  hoverColor: Colors.black.withOpacity(0.01),
                                  splashColor: Colors.black.withOpacity(0.01),
                                  focusColor: Colors.black.withOpacity(0.01),
                                  highlightColor:
                                      Colors.black.withOpacity(0.01),
                                  onTap: () {
                                    //
                                  },
                                  child: Container(
                                    height: 275,
                                    constraints: BoxConstraints(
                                      maxWidth: 225,
                                      maxHeight: 475,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.01),
                                      borderRadius: SmoothBorderRadius(
                                        cornerRadius: 30,
                                        cornerSmoothing: 0.5,
                                      ),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              "assets/svg/union.svg",
                                              width: 100,
                                            ),
                                            const SizedBox(height: 25),
                                            Text(
                                              "chat view desc".tr,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: !context.isDarkMode
                                                    ? Colors.black
                                                    : Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: chatGet.messages.isNotEmpty
                    ? Directionality(
                        textDirection: TextDirection.ltr,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            EasyGPTIconButton(
                              icon: Ionicons.reload,
                              onPressed: () {
                                //
                              },
                            ),
                            const SizedBox(width: 10),
                            EasyGPTIconButton(
                              icon: IconlyLight.download,
                              onPressed: () {
                                //
                              },
                            ),
                            const SizedBox(width: 10),
                            EasyGPTIconButton(
                              icon: IconlyLight.search,
                              onPressed: () {
                                //
                              },
                            ),
                            const SizedBox(width: 10),
                            EasyGPTIconButton(
                              icon: IconlyLight.arrow_down_2,
                              onPressed: () {
                                // chatGet.scrollDown();
                              },
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ),
              bottomNavigationBar: Obx(
                () => Container(
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                      vertical: BorderSide(
                        width: 1,
                        color: !context.isDarkMode
                            ? const Color(0xffF1F1F1).withOpacity(0.5)
                            : const Color(0xffF1F1F1).withOpacity(0.1),
                      ),
                    ),
                  ),
                  child: BottomAppBar(
                    elevation: 0,
                    color: !context.isDarkMode ? Colors.white : Colors.black,
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 20.0),
                        child: Wrap(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    width: 1,
                                    color: !context.isDarkMode
                                        ? const Color(0xffF1F1F1)
                                            .withOpacity(0.5)
                                        : const Color(0xffF1F1F1)
                                            .withOpacity(0.1),
                                  ),
                                ),
                              ),
                              child: EasyGPTChatTextField(
                                onChanged: (newValue) =>
                                    chatGet.message.value = newValue,
                                textfieldController:
                                    chatGet.chatTextFieldController,
                                hintText: "chatTextField".tr,
                                minLines: 1,
                                maxLines: 1,
                                prefixIcon: Ionicons.cube_outline,
                                suffixIcon: Ionicons.prism_outline,
                                suffixIconIsActive:
                                    chatGet.message.value.isEmpty
                                        ? false
                                        : true,
                                suffixIconOnPressed:
                                    chatGet.message.value.isEmpty
                                        ? null
                                        : () {
                                            chatGet.send();
                                          },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
