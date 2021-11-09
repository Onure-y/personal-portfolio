import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:personal_portfolio/models/question_model.dart';

class GameController extends GetxController with SingleGetTickerProviderMixin {
  bool gameState = false;
  bool isGameEnded = false;

  PageController pageController = new PageController(initialPage: 0);
  int correctAnswers = 0;

  List<QuestionModel> allQuestions = List.filled(
    3,
    QuestionModel(
      answer: '',
      question: '',
      options: ['', '', '', ''],
    ),
  );

  @override
  void onInit() {
    loadData();

    super.onInit();
  }

  void changeGameState() {
    gameState = gameState ? false : true;
    update();
  }

  Future loadData() async {
    final String jsonListData = await rootBundle.loadString('game_data.json');
    var jsonData = await json.decode(jsonListData);
    var data = jsonData['allQuestions'];
    for (var i = 0; i < 3; i++) {
      allQuestions[i] = QuestionModel(
        question: data[i]['question'],
        answer: data[i]['answer'],
        options: [
          data[i]['options'][0],
          data[i]['options'][1],
          data[i]['options'][2],
          data[i]['options'][3],
        ],
      );
    }
  }

  void checkAnswer(answer, choisedAnswer, currentIndex) async {
    allQuestions[currentIndex].isAnswered = true;
    if (answer == choisedAnswer) {
      correctAnswers++;
    }

    if (currentIndex == 2) {
      await Future.delayed(Duration(seconds: 1));
      isGameEnded = true;
      gameState = false;
      update();
    }

    pageController.animateToPage(currentIndex + 1,
        duration: Duration(seconds: 1), curve: Curves.easeIn);

    update();
  }

  void resetGame() {
    isGameEnded = false;
    gameState = false;
    for (var i = 0; i < 3; i++) {
      allQuestions[i].isAnswered = false;
    }
    correctAnswers = 0;

    update();
  }
}
