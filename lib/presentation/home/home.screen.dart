import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/presentation/home/controller/home.controller.dart';
import 'package:quiz_app/presentation/home/widgets/menu.widget.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz educacional'),
        backgroundColor: Colors.grey.shade900,
      ),
      backgroundColor: Colors.grey.shade800,
      body: MenuWidget(),
    );
  }
}
