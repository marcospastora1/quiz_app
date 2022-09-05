import 'package:flutter/material.dart';

class CenteredMessageWidget extends StatelessWidget {
  final String message;
  final IconData? icon;
  final double iconSize;
  final double fontSize;

  const CenteredMessageWidget({
    required this.message,
    this.iconSize = 64.0,
    this.fontSize = 14.0,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            child: Icon(
              icon,
              size: iconSize,
              color: Colors.black26,
            ),
            visible: icon != null,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Text(
              message,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
                color: Colors.black26,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
