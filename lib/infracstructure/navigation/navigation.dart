import 'package:get/get.dart';
import 'package:quiz_app/presentation/about/about.screen.dart';
import 'package:quiz_app/presentation/home/home.screen.dart';
import 'package:quiz_app/presentation/quiz/quiz.screen.dart';
import 'package:quiz_app/presentation/ranking/ranking.screen.dart';

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
    ),
    GetPage(
      name: Routes.ranking,
      page: () => RankingScreen(),
      binding: RankingControllerBinding(),
    ),
    GetPage(
      name: Routes.about,
      page: () => AboutScreen(),
      binding: AboutControllerBinding(),
    ),
  ];
}
