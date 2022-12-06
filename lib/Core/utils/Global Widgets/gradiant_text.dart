// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class GradiantTextButton extends StatelessWidget {
  final String text;
  final double size;
  final VoidCallback onPress;
  const GradiantTextButton({
    Key? key,
    required this.text,
    required this.size,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPress,
        child: Text(
          text,
          style: TextStyle(
              fontSize: size,
              fontWeight: FontWeight.bold,
              foreground: Paint()
                ..shader = const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 255, 0, 81),
                    Color.fromARGB(255, 92, 40, 233),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(const Rect.fromLTWH(100.0, 0.0, 200.0, 70.0))),
        ));
  }
}
