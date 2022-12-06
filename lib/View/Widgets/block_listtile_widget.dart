import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../View Model/app_provider.dart';

class BlockListTileWidget extends StatelessWidget {
  final String image;
  final String name;
  final String time;
  const BlockListTileWidget({
    Key? key,
    required this.image,
    required this.name,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: context.read<AppProvider>().isDark == 0
                ? const Color(0xFF1D0529)
                : Colors.white54,
            border: Border.all(color: Colors.grey.shade400)),
        height: 90,
        width: MediaQuery.of(context).size.width,
        child: ListTile(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(1.5),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.purple,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      image,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          name,
                          style: Theme.of(context).primaryTextTheme.subtitle1,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          trailing: SizedBox(
            height: 60,
            width: 53,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text(
                    time,
                    style: Theme.of(context).primaryTextTheme.caption,
                  ),
                ),
              ],
            ),
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
