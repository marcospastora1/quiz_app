import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/presentation/quiz/widgets/centered_message.widget.dart';
import 'package:quiz_app/presentation/quiz/widgets/quiz/answer.widget.dart';
import 'package:quiz_app/presentation/quiz/widgets/quiz/question.widget.dart';
import 'package:quiz_app/presentation/quiz/widgets/quiz/score.widget.dart';
import 'package:quiz_app/presentation/shared/loading/base.widget.dart';
import 'controllers/quiz.controller.dart';

class QuizScreen extends GetView<QuizController> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: Obx(
        () => Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff3338AC),
            title: Text(
              'Quiz ${controller.quiz} (${controller.scoreKeeper.length}/${controller.questionsEscolhidas.length})',
            ),
            centerTitle: true,
          ),
          backgroundColor: const Color(0xFF111111),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: controller.questionsNumber == 0
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CenteredMessageWidget(
                          message: 'Sem questões',
                          icon: Icons.warning,
                        ),
                        IconButton(
                          onPressed: controller.loadQuestions,
                          icon: const Icon(Icons.refresh),
                        )
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        QuestionWidget(question: controller.getQuestion()),
                        AnswerWidget(
                          sequencia: 'A)',
                          answer: controller.getAnswer1(),
                        ),
                        AnswerWidget(
                          sequencia: 'B)',
                          answer: controller.getAnswer2(),
                        ),
                        AnswerWidget(
                          sequencia: 'C)',
                          answer: controller.getAnswer3(),
                        ),
                        AnswerWidget(
                          sequencia: 'D)',
                          answer: controller.getAnswer4(),
                        ),
                        ScoreWidget(),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
