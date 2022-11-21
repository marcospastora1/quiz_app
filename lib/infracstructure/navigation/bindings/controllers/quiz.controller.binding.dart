import 'package:get/get.dart';
import 'package:quiz_app/infracstructure/navigation/bindings/domains/questions.repository.binding.dart';
import 'package:quiz_app/presentation/quiz/controllers/quiz.controller.dart';

class QuizControllerBinding extends Bindings {
  @override
  void dependencies() {
    final questionBinding = QuestionsRepositoryBinding();
    Get.lazyPut<QuizController>(
      () => QuizController(
        questionsRepository: questionBinding.repository,
      ),
    );
  }
}
