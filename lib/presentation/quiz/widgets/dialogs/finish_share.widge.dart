import 'package:flutter/material.dart';
import 'package:quiz_app/domain/questions/models/question.model.dart';

class FinishShare extends StatelessWidget {
  final BuildContext context;
  final int hitNumber;
  final int questionNumber;
  final QuestionModel questions;

  const FinishShare({
    required this.context,
    required this.hitNumber,
    required this.questionNumber,
    required this.questions,
  });

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.green,
                  maxRadius: 35,
                  child: SizedBox(
                    child: Icon(
                      hitNumber < 4 ? Icons.warning : Icons.favorite,
                      color: Colors.grey.shade900,
                    ),
                  ),
                ),
              ],
            ),
            const Text(
              'Parabéns',
              textAlign: TextAlign.left,
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
            Text(
              hitNumber < 5
                  ? 'Que tal tentar mais uma vez? Quem sabe você consegue acertar todas na próxima!'
                  : 'Uau, você acertou todas as questões, que tal tentar outra categoria?',
              style: const TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
