import 'package:easygpt/models/message.model.dart';
import 'package:easygpt/services/chatgpt.service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';

class ChatGet extends GetxController {
  // Variables
  var message = ''.obs;
  var searchBox = false.obs;
  List messages = <MessageModel>[].obs;
  final onUpdateStream = PublishSubject<bool>();

  final chatTextFieldController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    onUpdateStream.listen((_) {
      Future.delayed(const Duration(milliseconds: 100)).then((_) =>
          scrollController.jumpTo(scrollController.position.maxScrollExtent));
    });

    super.onInit();
  }

  // Functions

  void send() async {
    if (message.value.isEmpty) return;

    final myMessage = MessageModel(
      message: message.value,
    );

    messages.add(myMessage);

    onUpdateStream.sink.add(true);

    message.value = '';
    chatTextFieldController.clear();

    var response = await getResponse(Get.arguments);

    final chatgptMessage = MessageModel(
      message: response,
    );

    messages.add(chatgptMessage);

    onUpdateStream.sink.add(true);
  }
}
