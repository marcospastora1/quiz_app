import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/presentation/home/controller/home.controller.dart';
import 'package:quiz_app/presentation/home/widgets/menu.widget.dart';
import 'package:quiz_app/presentation/shared/drawer/drawer.widget.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bem vindo, preparado para o jogo?',
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: const Color(0xFF3338AC),
      ),
      drawer: DrawerWidget(),
      backgroundColor: const Color(0xFF111111),
      body: MenuWidget(),
    );
  }
}
