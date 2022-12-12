import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quiz_app/domain/core/constants/assets.constants.dart';
import 'package:quiz_app/domain/questions/models/question.model.dart';
import 'package:quiz_app/domain/utils/snackbar.util.dart';
import 'package:quiz_app/infracstructure/navigation/routes.dart';
import 'package:quiz_app/presentation/quiz/widgets/dialogs/finish_share.widge.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class FinishDialog extends StatelessWidget {
  final int hitNumber;
  final int questionNumber;
  final QuestionModel questions;
  final VoidCallback jogarNovamente;
  final screenshotController = ScreenshotController();

  FinishDialog({
    required this.hitNumber,
    required this.questionNumber,
    required this.questions,
    required this.jogarNovamente,
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
      title: Column(
        children: [
          Image.asset(AssetsConstants.alerta, width: 50, height: 50),
          const SizedBox(height: 5),
          Text(
            'Fim de jogo!',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            hitNumber <= 2
                ? 'Que pena, você acertou $hitNumber de $questionNumber!'
                : 'Parabéns, você acertou $hitNumber de $questionNumber!',
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: hitNumber <= 2 ? const Color(0xFFD11515) : Colors.green,
            ),
          ),
          const SizedBox(height: 8),
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
          onPressed: jogarNovamente,
          child: const Text('Jogar novamente'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.home,
              (Route<dynamic> route) => false,
            );
          },
          child: const Text('Menu'),
        ),
      ],
    );
  }
}
/* 
class FinishDialog {
  static Future show(
    BuildContext context, {
    required int hitNumber,
    required int questionNumber,
    required QuestionModel questions,
    required VoidCallback jogarNovamente,
  }) {
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
          title: Column(
            children: [
              Image.asset(AssetsConstants.alerta, width: 50, height: 50),
              const SizedBox(height: 5),
              Text(
                'Fim de jogo!',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                hitNumber <= 2
                    ? 'Que pena, você acertou $hitNumber de $questionNumber!'
                    : 'Parabéns, você acertou $hitNumber de $questionNumber!',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color:
                      hitNumber <= 2 ? const Color(0xFFD11515) : Colors.green,
                ),
              ),
              const SizedBox(height: 8),
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
              onPressed: jogarNovamente,
              child: const Text('Jogar novamente'),
            ),
            TextButton(
              onPressed: () {
                questions.answers.shuffle();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  Routes.home,
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text('Menu'),
            ),
          ],
        );
      },
    );
  }
} */

Future _saveShare(Uint8List bytes) async {
  Directory tempDir = await getTemporaryDirectory();
  final file = File('${tempDir.path}/quiz_result.png');
  await file.writeAsBytes(bytes);
  Share.shareFiles(
    ['${tempDir.path}/quiz_result.png'],
    text: 'Quiz app, em breve na play store',
  );
}
