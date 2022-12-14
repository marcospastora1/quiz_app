import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/presentation/ranking/controller/ranking.controller.dart';
import 'package:quiz_app/presentation/ranking/widgets/raking_list.widget.dart';
import 'package:quiz_app/presentation/shared/drawer/drawer.widget.dart';

class RankingScreen extends GetView<RankingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        title: Text(
          'Quem será que acertou mais questões?',
          style: GoogleFonts.poppins(fontSize: 14),
        ),
        backgroundColor: const Color(0xFF3338AC),
      ),
      drawer: DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.only(top: 29, left: 40, right: 40),
        child: RankingListWidget(
          rankingCompleto: controller.getRanking(),
        ),
      ),
    );
  }
}
