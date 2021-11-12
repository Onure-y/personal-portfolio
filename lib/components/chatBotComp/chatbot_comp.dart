import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_portfolio/components/chatBotComp/chatBotMessage_comp.dart';
import 'package:personal_portfolio/controllers/chatBot_controller.dart';

class ChatBot extends StatelessWidget {
  const ChatBot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<ChatBotController>(
        init: ChatBotController(),
        builder: (ChatBotController controller) {
          return Container(
            width: (size.width - 60) * 0.3,
            height: size.height * 0.6,
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      var chatList = controller.allAnswers;
                      return ChatBotMessage(
                        text: chatList[index].text,
                        isUserMessage: chatList[index].isUserMessage,
                        ishiMessage: chatList[index].hiMessage,
                      );
                    },
                    childCount: controller.allAnswers.length,
                  ),
                )
              ],
            ),
          );
        });
  }
}
