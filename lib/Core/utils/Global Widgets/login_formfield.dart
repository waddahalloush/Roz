// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:provider/provider.dart';

import '../../../View Model/app_provider.dart';

class LoginFormField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final Widget suffix;

  const LoginFormField({
    Key? key,
    required this.hint,
    required this.controller,
    this.suffix = const Text(""),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      height: 43,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: const GradientBoxBorder(
          gradient: LinearGradient(colors: [
            Color(0xFF862254),
            Color(0xFFFA457E),
            Color(0xFF483585),
            Color(0xFF7B49FF),
          ]),
          width: 2,
        ),
      ),
      child: TextFormField(
          textAlign: context.read<AppProvider>().locale.languageCode == 'ar'
              ? TextAlign.right
              : TextAlign.left,
          controller: controller,
          decoration: InputDecoration(
              suffixIcon: suffix,
              suffixIconColor: Colors.indigo,
              hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade800),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              hintText: hint)),
    );
  }
}
