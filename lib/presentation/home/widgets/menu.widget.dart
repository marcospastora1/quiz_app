import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/domain/core/constants/assets.constants.dart';
import 'package:quiz_app/presentation/home/controller/home.controller.dart';

class MenuWidget extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: 33,
      crossAxisSpacing: 43,
      padding: const EdgeInsets.all(10),
      crossAxisCount: 2,
      children: [
        _ItemMenuWidget(
          onTap: () => controller.navToQuestion(argument: 'Ciências'),
          imagem: AssetsConstants.cienciasV2,
        ),
        _ItemMenuWidget(
          onTap: () => controller.navToQuestion(argument: 'História'),
          imagem: AssetsConstants.historiaV2,
        ),
        _ItemMenuWidget(
            onTap: () => controller.navToQuestion(argument: 'Geografia'),
            imagem: AssetsConstants.geografiaV2),
        _ItemMenuWidget(
          onTap: () => controller.navToQuestion(argument: 'Português'),
          imagem: AssetsConstants.portuguesV2,
        ),
        _ItemMenuWidget(
          onTap: () => controller.navToQuestion(argument: 'Matemática'),
          imagem: AssetsConstants.matematicaV2,
        ),
        _ItemMenuWidget(
          onTap: () => controller.navToQuestion(argument: 'Geral'),
          imagem: AssetsConstants.geraisV2,
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
