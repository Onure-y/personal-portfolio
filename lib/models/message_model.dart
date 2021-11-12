class MessageModel {
  String text;
  bool isUserMessage;
  bool? hiMessage;

  MessageModel(
      {required this.text, required this.isUserMessage, this.hiMessage});
}
