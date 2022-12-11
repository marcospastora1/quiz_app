import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/domain/core/constants/assets.constants.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(AssetsConstants.logo, width: 250),
        IconButton(
          onPressed: Get.back,
          iconSize: 20,
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ],
    );
  }
}
