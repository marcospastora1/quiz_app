import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/domain/questions/models/question.model.dart';
import 'package:quiz_app/presentation/quiz/widgets/dialogs/finish_dialog.widget.dart';

class ResultDialog {
  static Future show(
    BuildContext context, {
    required QuestionModel question,
    required bool correct,
    required String sequencia,
    required int questionNow,
    questionNumber,
    required void Function() jogarNovamente,
  }) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
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
                    ? sequencia +
                        ' ' +
                        question.answers[0].resposta.toUpperCase()
                    : question.answers[1].verdadeira
                        ? sequencia +
                            ' ' +
                            question.answers[1].resposta.toUpperCase()
                        : question.answers[2].verdadeira
                            ? sequencia +
                                ' ' +
                                question.answers[2].resposta.toUpperCase()
                            : question.answers[3].verdadeira
                                ? sequencia +
                                    ' ' +
                                    question.answers[3].resposta.toUpperCase()
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
                      FinishDialog.show(
                        context,
                        hitNumber: questionNow,
                        questionNumber: questionNumber,
                        questions: question,
                        jogarNovamente: () => jogarNovamente(),
                      );
                    }
                  : () {
                      Navigator.of(context).pop();
                    },
            )
          ],
        );
      },
    );
  }
}
