import 'package:quiz_app/domain/questions/questions.repository.dart';
import 'package:quiz_app/infracstructure/services/questions/questions.service.dart';

class QuestionsRepositoryBinding {
  late QuestionsRepository _questionsRepository;
  QuestionsRepository get repository => _questionsRepository;

  QuestionsRepositoryBinding() {
    final questionsService = QuestionsService();
    _questionsRepository = QuestionsRepository(
      questionsService: questionsService,
    );
  }
}
