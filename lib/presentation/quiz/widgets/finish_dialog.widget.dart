import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quiz_app/domain/questions/models/question.model.dart';
import 'package:quiz_app/domain/utils/snackbar.util.dart';
import 'package:quiz_app/infracstructure/navigation/routes.dart';
import 'package:quiz_app/presentation/quiz/widgets/finish_share.widge.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class FinishDialog {
  static Future show(
    BuildContext context, {
    required int hitNumber,
    required int questionNumber,
    required QuestionModel questions,
  }) {
    final screenshotController = ScreenshotController();
    return showDialog(
      barrierDismissible: false,
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
              Text(
                hitNumber <= 2 ? 'Que pena' : 'Parabéns',
                style: const TextStyle(
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
                    : 'Uau, você acertou todas as quesões, que tal tentar outra categoria?',
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () async {
                try {
                  final capturedImage =
                      await screenshotController.captureFromWidget(
                    FinishShare(
                      context: context,
                      hitNumber: hitNumber,
                      questionNumber: questionNumber,
                      questions: questions,
                    ),
                  );
                  _saveShare(capturedImage);
                } catch (err) {
                  SnackbarUtil.showError(message: err.toString());
                }
              },
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
              child: const Text('Voltar ao menu'),
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

Future _saveShare(Uint8List bytes) async {
  Directory tempDir = await getTemporaryDirectory();
  final file = File('${tempDir.path}/quiz_result.png');
  await file.writeAsBytes(bytes);
  Share.shareFiles(
    ['${tempDir.path}/quiz_result.png'],
    text: 'Quiz app, em breve na play store',
  );
}
