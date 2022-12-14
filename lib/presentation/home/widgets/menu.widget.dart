import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
          onTap: () => controller.navToQuestion(argument: 'Matemática'),
          imagem: AssetsConstants.matematicaV2,
          titulo: 'Matemática',
          margem: 26,
        ),
        _ItemMenuWidget(
          onTap: () => controller.navToQuestion(argument: 'Português'),
          imagem: AssetsConstants.portuguesV2,
          titulo: 'Português',
          margem: 35,
        ),
        _ItemMenuWidget(
          onTap: () => controller.navToQuestion(argument: 'Ciências'),
          imagem: AssetsConstants.cienciasV2,
          titulo: 'Ciências',
          margem: 45,
        ),
        _ItemMenuWidget(
          onTap: () => controller.navToQuestion(argument: 'História'),
          imagem: AssetsConstants.historiaV2,
          titulo: 'História',
          margem: 47,
        ),
        _ItemMenuWidget(
          onTap: () => controller.navToQuestion(argument: 'Geografia'),
          imagem: AssetsConstants.geografiaV2,
          titulo: 'Geografia',
          margem: 37,
        ),
        _ItemMenuWidget(
          onTap: () => controller.navToQuestion(argument: 'Geral'),
          imagem: AssetsConstants.geraisV2,
          titulo: 'Conhecimentos \nGerais',
        )
      ],
    );
  }
}

class _ItemMenuWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String imagem, titulo;
  final double? margem;

  const _ItemMenuWidget({
    required this.onTap,
    required this.imagem,
    required this.titulo,
    this.margem = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: margem,
          child: Text(
            titulo,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 17,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
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
        ),
      ],
    );
  }
}
