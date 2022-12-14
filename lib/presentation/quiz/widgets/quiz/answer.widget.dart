import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/presentation/quiz/controllers/quiz.controller.dart';
import 'package:quiz_app/presentation/quiz/widgets/dialogs/result_dialog.widget.dart';

class AnswerWidget extends GetView<QuizController> {
  final String answer, sequencia;

  const AnswerWidget({required this.answer, required this.sequencia});

  @override
  Widget build(BuildContext context) {
    final correct = false.obs;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: GestureDetector(
          child: Obx(
            () => Container(
              decoration: BoxDecoration(
                  color: correct.value
                      ? const Color(0xFF12692F)
                      : const Color(0xFF954EFF),
                  borderRadius: BorderRadius.circular(4)),
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
              child: AutoSizeText(
                sequencia + ' ' + answer.toUpperCase(),
                maxLines: 2,
                textAlign: TextAlign.left,
                minFontSize: 10.0,
                maxFontSize: 32.0,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          onTap: () async {
            controller.click.value = true;
            correct.value = controller.correctAnswer(answer);
            await Future.delayed(const Duration(milliseconds: 500));

            controller.scoreKeeper.add(
              Icon(
                correct.value ? Icons.check : Icons.close,
                color: correct.value ? Colors.green : Colors.red,
              ),
            );

            if (correct.value == false) {
              Get.dialog(
                barrierDismissible: false,
                ResultDialog(
                  question: controller.question,
                  correct: correct.value,
                  questionNow: controller.scoreKeeper.length,
                  questionNumber: controller.questionsNumber,
                  jogarNovamente: controller.jogarNovamente,
                  nextQuestion: controller.nextQuestion,
                  hitNumber: controller.hitNumber.value,
                  salvarRanking: controller.salvarRanking,
                ),
              );
            } else if (controller.scoreKeeper.length <
                controller.questionsNumber) {
              controller.nextQuestion();
            } else {
              await Future.delayed(const Duration(milliseconds: 200));
              if (controller.scoreKeeper.length == 5 && correct.value) {
                controller.nextQuestion();
              }
            }
          },
        ),
      ),
    );
  }
}
