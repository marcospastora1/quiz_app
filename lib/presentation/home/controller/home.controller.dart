import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/infracstructure/navigation/routes.dart';
import 'package:quiz_app/presentation/quiz/widgets/dialogs/nome_dialog.widget.dart';

class HomeController extends GetxController {
  final controller = TextEditingController();
  void navToQuestion({required String argument}) {
    Get.dialog(
      barrierDismissible: false,
      NomeDialogWidget(
        controller: controller,
        salvar: () {
          Get.toNamed(
            Routes.quiz,
            arguments: {"quiz": argument, "nome": controller.text.trim()},
          );
        },
      ),
    );
  }
}
