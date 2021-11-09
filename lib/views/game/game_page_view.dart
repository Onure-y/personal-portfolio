import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_portfolio/constants.dart';
import 'package:personal_portfolio/controllers/game_controller.dart';
import 'package:personal_portfolio/models/question_model.dart';

class GameScreen extends GetWidget<GameController> {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.85 - 100,
      width: ((size.width - 100) / 2) * 0.415,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/bg-2.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: GetBuilder(
          init: GameController(),
          builder: (GameController controller) {
            return PageView.builder(
              // physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              controller: controller.pageController,
              itemBuilder: (BuildContext context, int currentPageIndex) {
                QuestionModel questionModal =
                    controller.allQuestions[currentPageIndex];

                return Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        height: (size.height * 0.85 - 100) * 0.4,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            ' " ${controller.allQuestions[currentPageIndex].question} " ',
                            style: questionTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 4,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: questionModal.isAnswered
                                        ? questionModal.options[index] ==
                                                questionModal.answer
                                            ? Colors.green
                                            : Colors.red
                                        : Colors.white60,
                                    minimumSize: Size(size.width * 0.7, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.5),
                                    ),
                                  ),
                                  onPressed: () {
                                    controller.checkAnswer(
                                        questionModal.answer,
                                        questionModal.options[index],
                                        currentPageIndex);
                                  },
                                  child: questionModal.options[3] == ''
                                      ? CircularProgressIndicator()
                                      : Text('${questionModal.options[index]}',
                                          style: answerStyle),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                );
              },
            );
          }),
    );
  }
}
