import 'package:quiz_app/domain/questions/models/question.model.dart';
import 'package:quiz_app/infracstructure/services/questions/questions.service.dart';

class QuestionsRepository {
  final QuestionsService _questionsService;

  const QuestionsRepository({required QuestionsService questionsService})
      : _questionsService = questionsService;

  Future<List<QuestionModel>> getQuestions() async {
    try {
      final response = await _questionsService.getQuestionsCiencias();
      final models = response.map((e) => QuestionModel.fromData(e)).toList();
      return models;
    } catch (err) {
      rethrow;
    }
  }
}
