import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/presentation/about/controllers/about.controller.dart';
import 'package:quiz_app/presentation/about/widgets/components_list.widget.dart';
import 'package:quiz_app/presentation/shared/drawer/drawer.widget.dart';

class AboutScreen extends GetView<AboutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7E7E7),
      appBar: AppBar(
        title: Text(
          'Sobre o projeto',
          style: GoogleFonts.poppins(fontSize: 14),
        ),
        backgroundColor: const Color(0xFF3338AC),
      ),
      drawer: DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: ComponentsListWidget(),
      ),
    );
  }
}
