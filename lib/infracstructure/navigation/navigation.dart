import 'package:get/get.dart';
import 'package:quiz_app/presentation/home/home.screen.dart';
import 'package:quiz_app/presentation/quiz/quiz.screen.dart';

import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.home,
      page: () => HomeScreen(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.quiz,
      page: () => QuizScreen(),
      binding: QuizControllerBinding(),
    )
  ];
}
