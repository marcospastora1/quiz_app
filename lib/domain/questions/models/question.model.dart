import 'package:quiz_app/infracstructure/services/data/question.data.dart';

class QuestionModel {
  final String question;
  final String answer1;
  final String answer2;

  const QuestionModel({
    required this.question,
    required this.answer1,
    required this.answer2,
  });

  factory QuestionModel.fromData(QuestionData data) {
    return QuestionModel(
      question: data.question,
      answer1: data.answer1,
      answer2: data.answer2,
    );
  }
}
