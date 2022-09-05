import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/presentation/home/widgets/centered_message.widget.dart';
import 'package:quiz_app/presentation/home/widgets/finish_dialog.widget.dart';
import 'package:quiz_app/presentation/home/widgets/result_dialog.widget.dart';
import 'package:quiz_app/presentation/shared/loading/base.widget.dart';

import 'package:auto_size_text/auto_size_text.dart';

import './controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  final scoreKeeper = <Widget>[].obs;
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: Obx(
        () => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey.shade900,
            title: Text(
              'Quiz Educacional (${scoreKeeper.length}/${controller.questions.length})',
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.grey.shade900,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: controller.questionsNumber == 0
                  ? const CenteredMessageWidget(
                      message: 'Sem questões',
                      icon: Icons.warning,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildQuestion(controller.getQuestion()),
                        _buildAnswerButton(controller.getAnswer1(), context),
                        _buildAnswerButton(controller.getAnswer2(), context),
                        _buildScoreKeeper(),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }

  _buildQuestion(String question) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Center(
          child: Text(
            question,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  _buildAnswerButton(String answer, BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: GestureDetector(
          child: Container(
            padding: const EdgeInsets.all(4.0),
            color: Colors.blue,
            child: Center(
              child: AutoSizeText(
                answer,
                maxLines: 2,
                minFontSize: 10.0,
                maxFontSize: 32.0,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          onTap: () {
            bool correct = controller.correctAnswer(answer);

            ResultDialog.show(
              context,
              question: controller.question,
              correct: correct,
              onNext: () {
                scoreKeeper.add(
                  Icon(
                    correct ? Icons.check : Icons.close,
                    color: correct ? Colors.green : Colors.red,
                  ),
                );

                if (scoreKeeper.length < controller.questionsNumber) {
                  controller.nextQuestion();
                } else {
                  FinishDialog.show(
                    context,
                    hitNumber: controller.hitNumber.value,
                    questionNumber: controller.questionsNumber,
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }

  _buildScoreKeeper() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: scoreKeeper,
      ),
    );
  }
}
