import 'package:get/get.dart';
import 'package:quiz_app/infracstructure/navigation/routes.dart';

class HomeController extends GetxController {
  void navToQuestion({required String argument}) {
    Get.toNamed(Routes.quiz, arguments: argument);
  }
}
