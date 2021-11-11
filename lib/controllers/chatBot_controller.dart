import 'package:get/get.dart';
import 'package:personal_portfolio/models/message_model.dart';

class ChatBotController extends GetxController {
  bool isChatBotOpen = false;

  List<MessageModel> chatBotMessages = [
    MessageModel(text: 'Hi I\'m chat bot astra :)', isUserMessage: false),
    MessageModel(text: 'How Can I Help You', isUserMessage: false),
  ];

  List<MessageModel> answerOptions = [
    MessageModel(text: 'Hello, I just wanted to say hi', isUserMessage: true),
    MessageModel(text: 'I would like to hire you', isUserMessage: true),
  ];

  List<MessageModel> allAnswers = [];

  void changeChatBotState() {
    isChatBotOpen = !isChatBotOpen;
    update();
  }

  void setInitMessage() {
    allAnswers.add(chatBotMessages[0]);
    allAnswers.add(chatBotMessages[1]);
    allAnswers.add(answerOptions[0]);
    allAnswers.add(answerOptions[1]);
  }

  @override
  void onInit() {
    setInitMessage();
    super.onInit();
  }
}
