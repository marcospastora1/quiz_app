import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/domain/core/constants/assets.constants.dart';
import 'package:quiz_app/presentation/home/controller/home.controller.dart';

class MenuWidget extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      padding: const EdgeInsets.all(10),
      crossAxisCount: 2,
      children: [
        _ItemMenuWidget(
          onTap: () => controller.navToQuestion(argument: 'Ciências'),
          imagem: AssetsConstants.ciencias,
        ),
        _ItemMenuWidget(
          onTap: () => controller.navToQuestion(argument: 'História'),
          imagem: AssetsConstants.historia,
        ),
        _ItemMenuWidget(
          onTap: () => controller.navToQuestion(argument: 'Geografia'),
          imagem: AssetsConstants.geografia,
        ),
        _ItemMenuWidget(
          onTap: () => controller.navToQuestion(argument: 'Português'),
          imagem: AssetsConstants.portugues,
        ),
        _ItemMenuWidget(
          onTap: () => controller.navToQuestion(argument: 'Matemática'),
          imagem: AssetsConstants.matematica,
        ),
        _ItemMenuWidget(
          onTap: () => controller.navToQuestion(argument: 'Geral'),
          imagem: AssetsConstants.gerais,
        )
      ],
    );
  }
}

class _ItemMenuWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String imagem;

  const _ItemMenuWidget({required this.onTap, required this.imagem});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(),
      ),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(imagem),
            fit: BoxFit.cover,
          ),
        ),
        child: InkWell(
          splashColor: Colors.redAccent.withAlpha(100),
          borderRadius: BorderRadius.circular(15),
          onTap: onTap,
        ),
      ),
    );
  }
}
