import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/domain/questions/models/question.model.dart';
import 'package:quiz_app/infracstructure/navigation/routes.dart';
import 'package:share_plus/share_plus.dart';

class FinishDialog {
  static Future show(
    BuildContext context, {
    required int hitNumber,
    required int questionNumber,
    required QuestionModel questions,
  }) {
    return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade900,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          title: CircleAvatar(
            backgroundColor: Colors.green,
            maxRadius: 35,
            child: Icon(
              hitNumber < 5 ? Icons.warning : Icons.favorite,
              color: Colors.grey.shade900,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Parabéns',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Você acertou $hitNumber de $questionNumber!',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Que tal tentar mais uma vez? Quem sabe você consegue acertar todas na próxima!',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Share.share(
                'Quiz Educacional. Você acertou $hitNumber de $questionNumber!',
              ),
              child: const Text('Compartilhar'),
            ),
            TextButton(
              onPressed: () {
                questions.answers.shuffle();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  Routes.home,
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text('Jogar novamente'),
            ),
            const TextButton(
              onPressed: SystemNavigator.pop,
              child: Text('Sair'),
            )
          ],
        );
      },
    );
  }
}
