import 'package:easygpt/models/message.model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';

class ChatsGet extends GetxController {
  // Variables
  var message = ''.obs;
  List<MessageModel> messages = [];
  final onUpdateStream = PublishSubject<bool>();

  ScrollController scrollController = ScrollController();
}
