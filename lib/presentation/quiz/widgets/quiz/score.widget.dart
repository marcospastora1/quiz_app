import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz_app/presentation/quiz/controllers/quiz.controller.dart';

class ScoreWidget extends GetView<QuizController> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: controller.scoreKeeper,
      ),
    );
  }
}
