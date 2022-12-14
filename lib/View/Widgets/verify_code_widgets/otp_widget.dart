// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:pinput/pinput.dart';

class OTPWidget extends StatelessWidget {
  final TextEditingController pinController;
  const OTPWidget({
    Key? key,
    required this.pinController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: Colors.white,
        border: GradientBoxBorder(
          gradient: LinearGradient(colors: [
            Color(0xFF862254),
            Color(0xFFFA457E),
            Color(0xFF483585),
            Color(0xFF7B49FF),
          ]),
          width: 2,
        ),
        shape: BoxShape.circle,
      ),
    );

    return Pinput(controller: pinController,
      closeKeyboardWhenCompleted: true,
      defaultPinTheme: defaultPinTheme,
      keyboardType: TextInputType.number,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) {},
    );
  }
}
