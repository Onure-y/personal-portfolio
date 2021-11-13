import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:personal_portfolio/models/mail_model.dart';
import 'package:personal_portfolio/models/message_model.dart';

class ChatBotController extends GetxController {
  bool isChatBotOpen = false;
  bool isEmailScreenOpen = false;
  bool isEmailSended = false;

  CollectionReference mails = FirebaseFirestore.instance.collection('mails');

  MailModel mailModel =
      MailModel(name: '', email: '', subject: '', message: '');

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  List<MessageModel> chatBotMessages = [
    MessageModel(text: 'Hi I\'m chat bot astra :)', isUserMessage: false),
    MessageModel(text: 'How Can I Help You', isUserMessage: false),
    MessageModel(text: 'Oh great', isUserMessage: false),
    MessageModel(text: 'Just send me an Email ', isUserMessage: false),
  ];

  List<MessageModel> hellotextMessages = [
    MessageModel(text: 'Oh thanks', isUserMessage: false),
    MessageModel(text: 'Thanks for saying hi', isUserMessage: false),
    MessageModel(
        text: 'is there anything i can help you with', isUserMessage: false),
  ];

  List<MessageModel> answerOptions = [
    MessageModel(
        text: 'Hello, I just wanted to say hi',
        isUserMessage: true,
        hiMessage: true),
    MessageModel(
      text: 'I would like to hire you',
      isUserMessage: true,
      hiMessage: false,
    )
  ];

  List<MessageModel> allAnswers = [];

  void changeChatBotState() {
    isChatBotOpen = !isChatBotOpen;
    update();
  }

  void changeEmailScreenState() {
    isEmailScreenOpen = !isEmailScreenOpen;
    update();
  }

  void helloTextFunction() async {
    for (var i = 0; i < hellotextMessages.length; i++) {
      await Future.delayed(Duration(seconds: 1));
      allAnswers.add(hellotextMessages[i]);
      update();
    }
    allAnswers.add(answerOptions[1]);
  }

  void goToEmailScreen() async {
    allAnswers.add(chatBotMessages[2]);
    update();
    await Future.delayed(Duration(seconds: 1));
    allAnswers.add(chatBotMessages[3]);
    update();
    await Future.delayed(Duration(seconds: 1));
    isChatBotOpen = false;
    await Future.delayed(Duration(seconds: 1));
    openEmailScreen();
    update();
  }

  void openEmailScreen() {
    isEmailScreenOpen = true;
  }

  void setMailSettings() {
    mailModel.name = nameController.text;
    mailModel.email = emailController.text;
    mailModel.subject = subjectController.text;
    mailModel.message = messageController.text;
    sendToDb();
  }

  void printMailSettings() async {
    var data = await mails.get();
    data.docs.forEach((element) {
      print(element.data());
    });
  }

  void sendToDb() async {
    mails.add({
      'name': mailModel.name,
      'email': mailModel.email,
      'subject': mailModel.subject,
      'message': mailModel.message,
    });
    await Future.delayed(Duration(seconds: 1));
    isEmailSended = true;
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
    // printMailSettings();
    super.onInit();
  }
}
