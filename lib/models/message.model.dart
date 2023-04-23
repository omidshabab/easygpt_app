class MessageModel {
  String? message;

  MessageModel({
    this.message,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      message: json['message'],
    );
  }
}
