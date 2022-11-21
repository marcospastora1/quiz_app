import 'package:flutter/material.dart';
import 'package:quiz_app/domain/questions/models/question.model.dart';

class ResultDialog {
  static Future show(
    BuildContext context, {
    required QuestionModel question,
    required bool correct,
    required Function onNext,
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
            backgroundColor: correct ? Colors.green : Colors.red,
            child: Icon(
              correct ? Icons.check : Icons.close,
              color: Colors.grey.shade900,
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
              Text(
                question.answers[0].verdadeira
                    ? question.answers[0].resposta
                    : question.answers[1].verdadeira
                        ? question.answers[1].resposta
                        : question.answers[2].verdadeira
                            ? question.answers[2].resposta
                            : question.answers[3].verdadeira
                                ? question.answers[3].resposta
                                : '',
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
          actions: [
            TextButton(
              child: const Text('PRÓXIMO'),
              onPressed: () {
                Navigator.of(context).pop();
                onNext();
              },
            )
          ],
        );
      },
    );
  }
}
