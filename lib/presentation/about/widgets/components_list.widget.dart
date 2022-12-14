import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/domain/core/constants/assets.constants.dart';

class ComponentsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          'Esse projeto foi desenvolvido por alunos do 4° período dos cursos de Sistemas de Informação e Análise e Desenvolvimento de Sistemas. O objetivo desse é projeto é tornar as aulas mais dinâmicas através do uso da tecnologia.',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
        ),
        const _ComponentItem(
          imagem: AssetsConstants.glayton,
          nome: 'Glayton Veríssimo',
          descricao: 'Cyber Segurity Spport Technician.',
        ),
        const _ComponentItem(
          imagem: AssetsConstants.jefferson,
          nome: 'Jefferson Cruz',
          descricao: 'Estudante de tecnologias Front-End.',
        ),
        const _ComponentItem(
          imagem: AssetsConstants.jose,
          nome: 'José Renato',
          descricao: 'Estudante de tecnologias Mobile e Banco de Dados.',
        ),
        const _ComponentItem(
          imagem: AssetsConstants.marcos,
          nome: 'Marcos Pastora',
          descricao: 'Estagiário e esudante de tecnologias Mobile e Back-end.',
        ),
        const _ComponentItem(
          imagem: AssetsConstants.ravel,
          nome: 'Ravel Cravo',
          descricao: 'Desenvolvedor DotNet.',
        ),
        const _ComponentItem(
          imagem: AssetsConstants.wasny,
          nome: 'Wasny Moreira',
          descricao: 'Estudante de tecnologias Full-Stack.',
        ),
      ],
    );
  }
}

class _ComponentItem extends StatelessWidget {
  final String imagem, nome, descricao;

  const _ComponentItem({
    required this.imagem,
    required this.nome,
    required this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Image.asset(
            imagem,
            width: 60,
            height: 60,
          ),
          const SizedBox(width: 18),
          Flexible(
            child: Column(
              children: [
                Text(
                  nome,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(),
                ),
                Text(
                  descricao,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
