import 'package:flutter/material.dart';
import 'package:roz/Core/utils/media_query_ex.dart';

class LoginButton extends StatelessWidget {
  final String label;
  final String icon;
  final Color color;
  final VoidCallback onPress;
  const LoginButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.color,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        width: context.width,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: color),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              icon,
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 30,
            ),
            Text(
              label,
              style: Theme.of(context).primaryTextTheme.headline3,
            ),
          ],
        ),
      ),
    );
  }
}
