import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/domain/questions/models/question.model.dart';
import 'package:quiz_app/presentation/quiz/widgets/dialogs/finish_dialog.widget.dart';

class ResultDialog extends StatelessWidget {
  final QuestionModel question;
  final bool correct;
  final int questionNow, questionNumber, hitNumber;
  final void Function() jogarNovamente, nextQuestion;

  const ResultDialog({
    required this.question,
    required this.correct,
    required this.questionNow,
    required this.questionNumber,
    required this.hitNumber,
    required this.jogarNovamente,
    required this.nextQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey.shade900,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      title: CircleAvatar(
        foregroundColor: Colors.white,
        backgroundColor: correct ? Colors.green : Colors.red,
        child: Icon(
          correct ? Icons.check : Icons.close,
          color: Colors.grey.shade900,
          size: 35,
        ),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            question.question,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            correct ? 'Você acertou!' : 'Você errou! O correto é: ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: correct ? Colors.green : Colors.red,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            question.answers[0].verdadeira
                ? question.answers[0].resposta.toUpperCase()
                : question.answers[1].verdadeira
                    ? question.answers[1].resposta.toUpperCase()
                    : question.answers[2].verdadeira
                        ? question.answers[2].resposta.toUpperCase()
                        : question.answers[3].verdadeira
                            ? question.answers[3].resposta.toUpperCase()
                            : '',
            style: GoogleFonts.poppins(
              color: Colors.green,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
      actions: [
        TextButton(
          child: const Text('PRÓXIMO'),
          onPressed: questionNow == 5
              ? () {
                  Navigator.of(context).pop();
                  Get.dialog(
                    barrierDismissible: false,
                    FinishDialog(
                      hitNumber: hitNumber,
                      questionNumber: questionNumber,
                      questions: question,
                      jogarNovamente: () => jogarNovamente(),
                    ),
                  );
                }
              : () {
                  Navigator.of(context).pop();
                  nextQuestion();
                },
        )
      ],
    );
  }
}
