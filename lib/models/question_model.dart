class QuestionModel {
  String question;
  String answer;
  List<String> options;
  bool isAnswered = false;

  QuestionModel({
    required this.question,
    required this.answer,
    required this.options,
  });
}
