import 'package:flutter/material.dart';

class GiftsWidget extends StatelessWidget {
  final IconData icon;
  final int count;
  const GiftsWidget({
    Key? key,
    required this.icon,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          Text(
            "x $count",
            style: Theme.of(context).primaryTextTheme.subtitle1,
          )
        ],
      ),
    );
  }
}
