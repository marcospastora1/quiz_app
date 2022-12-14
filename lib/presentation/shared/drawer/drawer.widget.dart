import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/infracstructure/navigation/routes.dart';
import 'package:quiz_app/presentation/home/controller/home.controller.dart';
import 'package:quiz_app/presentation/shared/drawer/logo.widget.dart';
import 'package:quiz_app/presentation/shared/drawer/item_menu.widget.dart';

class DrawerWidget extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * .85,
      child: Drawer(
        child: Material(
          color: const Color(0xFF111111),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 15, bottom: 15),
                  child: LogoWidget(),
                ),
                const SizedBox(height: 15),
                ItemMenuWidget(
                  label: 'Ranking geral',
                  onTap: () => Get.toNamed(Routes.ranking),
                ),
                ItemMenuWidget(
                  label: 'Sobre o projeto',
                  onTap: () {},
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
