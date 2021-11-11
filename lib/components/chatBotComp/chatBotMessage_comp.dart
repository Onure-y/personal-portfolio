import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_portfolio/constants.dart';

class ChatBotMessage extends StatelessWidget {
  const ChatBotMessage(
      {Key? key, required this.text, required this.isUserMessage})
      : super(key: key);
  final String text;
  final bool isUserMessage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: InkWell(
            focusColor: Colors.white60,
            hoverColor: Colors.white60,
            onTap: isUserMessage
                ? () {
                    print('hi');
                  }
                : null,
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
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
  }
}
