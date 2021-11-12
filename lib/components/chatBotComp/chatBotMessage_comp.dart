import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_portfolio/constants.dart';
import 'package:personal_portfolio/controllers/chatBot_controller.dart';

class ChatBotMessage extends StatelessWidget {
  const ChatBotMessage(
      {Key? key,
      required this.text,
      required this.isUserMessage,
      this.ishiMessage})
      : super(key: key);
  final String text;
  final bool isUserMessage;
  final bool? ishiMessage;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatBotController>(
        init: ChatBotController(),
        builder: (ChatBotController controller) {
          return Row(
            mainAxisAlignment:
                isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Flexible(
                child: InkWell(
                  focusColor: Colors.white60,
                  hoverColor: Colors.white60,
                  onTap: isUserMessage
                      ? ishiMessage!
                          ? () => controller.helloTextFunction()
                          : () => controller.goToEmailScreen()
                      : null,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      color: isUserMessage ? Colors.blue : Colors.transparent,
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    ),
                    child: Text(text, style: chatBotMessageStyle),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
