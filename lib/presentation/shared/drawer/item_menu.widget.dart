import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemMenuWidget extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const ItemMenuWidget({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        label,
        style: Get.textTheme.bodyText2!.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
