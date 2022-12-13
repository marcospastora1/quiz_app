import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NomeDialogWidget extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback salvar;

  const NomeDialogWidget({this.controller, required this.salvar});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey.shade900,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      title: Text(
        'Digite seu nome para o Ranking',
        style: GoogleFonts.poppins(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      content: TextFormField(
        controller: controller,
        style: GoogleFonts.poppins(color: Colors.white),
        decoration: InputDecoration(
          isDense: false,
          hintText: 'Digite aqui',
          fillColor: const Color(0xFFF3F3F4),
          errorStyle: const TextStyle(fontSize: 10, height: .5),
          suffixIconConstraints: const BoxConstraints(
            minHeight: 24,
            minWidth: 24,
          ),
          hintStyle: Get.textTheme.headline4!
              .copyWith(color: Colors.white, fontSize: 15),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFB8B8B9)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFB8B8B9), width: 2),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFB8B8B9)),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFB8B8B9)),
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: salvar, child: Text('Salvar'.toUpperCase()))
      ],
    );
  }
}
