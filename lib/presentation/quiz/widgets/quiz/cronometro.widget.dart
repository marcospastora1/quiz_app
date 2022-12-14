import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CronometroWidget extends StatelessWidget {
  final RxInt cronometro;

  const CronometroWidget({required this.cronometro});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: cronometro.value <= 5 ? Colors.red : Colors.green,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(
            '00:${cronometro.value < 10 ? '0' + cronometro.value.toString() : cronometro.value.toString()}',
            style: GoogleFonts.poppins(
                color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
