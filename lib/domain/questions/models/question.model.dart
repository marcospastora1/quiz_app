import 'package:quiz_app/domain/questions/models/answer.model.dart';
import 'package:quiz_app/infracstructure/services/data/question.data.dart';

class QuestionModel {
  final String question;
  final List<AnswerModel> answers;

  const QuestionModel({required this.answers, required this.question});

  factory QuestionModel.fromData(QuestionData questions) {
    return QuestionModel(
      question: questions.question,
      answers: questions.answers.map((e) => AnswerModel.fromData(e)).toList(),
    );
  }
}
