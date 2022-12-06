import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  const UserInfoWidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
                                  icon,
                                  color: Theme.of(context).iconTheme.color,
                                  size: 16,
                                ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: Theme.of(context).primaryTextTheme.headline2,
        ),
      ],
    );
  }
}
