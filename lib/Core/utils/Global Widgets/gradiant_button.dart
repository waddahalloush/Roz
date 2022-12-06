import 'package:flutter/material.dart';

class GradiantButton extends StatelessWidget {
  final String text;
  final VoidCallback onpress;
  const GradiantButton({
    Key? key,
    required this.text,
    required this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 180,
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          boxShadow: const [BoxShadow(blurRadius: 1)],
          borderRadius: BorderRadius.circular(25),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFA457E),
              Color(0xFF7B49FF),
            ],
          ),
        ),
        child: TextButton(
          onPressed: onpress,
          child:
              Text(text, style: Theme.of(context).primaryTextTheme.headline5),
        ),
      ),
    );
  }
}
