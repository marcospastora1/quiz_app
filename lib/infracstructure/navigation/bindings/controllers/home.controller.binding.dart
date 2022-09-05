import 'package:get/get.dart';
import 'package:quiz_app/infracstructure/navigation/bindings/domains/questions.repository.binding.dart';
import 'package:quiz_app/presentation/home/controllers/home.controller.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    final questionBinding = QuestionsRepositoryBinding();
    Get.lazyPut<HomeController>(
      () => HomeController(
        questionsRepository: questionBinding.repository,
      ),
    );
  }
}
