import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quiz_app/domain/core/constants/storage.constants.dart';
import 'package:quiz_app/infracstructure/navigation/routes.dart';
import 'package:quiz_app/presentation/quiz/widgets/dialogs/nome_dialog.widget.dart';

class HomeController extends GetxController {
  final controller = TextEditingController();
  final _storage = Get.find<GetStorage>();

  void navToQuestion({required String argument}) {
    if (_storage.hasData(StorageConstants.jogador)) {
      Get.toNamed(
        Routes.quiz,
        arguments: {
          "quiz": argument,
          "nome": _storage.read(StorageConstants.jogador)
        },
      );
    } else {
      Get.dialog(
        barrierDismissible: false,
        NomeDialogWidget(
          controller: controller,
          salvar: () async {
            await _storage.write(
              StorageConstants.jogador,
              controller.text.trim(),
            );
            Get.toNamed(
              Routes.quiz,
              arguments: {
                "quiz": argument,
                "nome": _storage.read(StorageConstants.jogador)
              },
            );
          },
        ),
      );
    }
  }
}
