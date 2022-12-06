import 'package:flutter/material.dart';

class ProfileReactionWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  const ProfileReactionWidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.pinkAccent,
            size: 18,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Text(
              text,
              style: Theme.of(context).primaryTextTheme.bodyText1,
            ),
          ),
        ],
      ),
    );
  }
}
