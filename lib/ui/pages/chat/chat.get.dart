import 'package:easygpt/models/message.model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';

class ChatGet extends GetxController {
  // Variables
  var message = ''.obs;
  List<MessageModel> messages = [];
  final onUpdateStream = PublishSubject<bool>();

  final chatTextFieldController = TextEditingController();
  ScrollController scrollController = ScrollController();

  // Functions
  void send() {
    if (message.value.isEmpty) return;

    final myMessage = MessageModel(
      message: message.value,
    );

    messages.add(myMessage);

    message.value = '';
    chatTextFieldController.clear();
    onUpdateStream.sink.add(true);
  }
}
