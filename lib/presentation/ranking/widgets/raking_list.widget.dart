import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RankingListWidget extends StatelessWidget {
  final List<Map<String, dynamic>> rankingCompleto;

  const RankingListWidget({required this.rankingCompleto});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: rankingCompleto.length,
      separatorBuilder: (_, __) => const SizedBox(height: 25),
      itemBuilder: (_, index) {
        return _ItemListWidget(
          pessoa: rankingCompleto[index],
          colocacao: index + 1,
        );
      },
    );
  }
}

class _ItemListWidget extends StatelessWidget {
  final Map<String, dynamic> pessoa;
  final int colocacao;

  const _ItemListWidget({required this.pessoa, required this.colocacao});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 13, left: 12, bottom: 12),
      height: 46,
      decoration: BoxDecoration(
        color: const Color(0xFF954EFF),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        '$colocacaoº ${pessoa['Nome']}, ${pessoa['Pontos']} Pontos',
        style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
      ),
    );
  }
}
