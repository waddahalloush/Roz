// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RoundedGradiantButton extends StatelessWidget {
  final IconData icon;
  final double dimenstion;
  final VoidCallback onTaap;
  const RoundedGradiantButton({
    Key? key,
    required this.icon,
    required this.dimenstion,
    required this.onTaap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTaap,
      child: Container(
        alignment: Alignment.center,
        width: dimenstion,
        height: dimenstion,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFA457E),
              Color(0xFF7B49FF),
            ],
          ),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: dimenstion / 2,
        ),
      ),
    );
  }
}
