import 'package:flutter/material.dart';
import 'package:roz/Core/utils/media_query_ex.dart';

import '../../../Core/constants/app_strings.dart';
import '../../../Core/constants/asset_manager.dart';

void showVideoCallGetCoinsBottomSheet(BuildContext context) =>
    showModalBottomSheet(
        barrierColor: Colors.transparent,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => DraggableScrollableSheet(
              initialChildSize: 0.7,
              builder: (context, scrollController) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: context.width,
                height: context.height,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(35))),
                child: const VideoCallGetCoinsSheet(),
              ),
            ));

class VideoCallGetCoinsSheet extends StatelessWidget {
  const VideoCallGetCoinsSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.dehaze_sharp,
              color: Colors.white,
            )),
        Container(
          decoration: BoxDecoration(
              color: const Color(0xFF1D0529),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
               const CircleAvatar(
              radius: 18,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(AssetManager.coin),
            ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "25",
                style: Theme.of(context).primaryTextTheme.headline5,
              ),
            ],
          ),
        ),
        Text(
          AppStrings.selectPlan(context),
          style: Theme.of(context).primaryTextTheme.headline5,
        ),
        const GetCoinsWidget(
          text: "100 Coins",
          duration: 3,
          price: 0.99,
        ),
        const GetCoinsWidget(
          text: "1000 Coins",
          duration: 3,
          price: 8.99,
        ),
        const GetCoinsWidget(
          text: "5000 Coins",
          duration: 3,
          price: 43.99,
        ),
        const GetCoinsWidget(
          text: "12000 Coins",
          duration: 3,
          price: 99.99,
        ),
        const GetCoinsWidget(
          text: "36500 Coins",
          duration: 3,
          price: 299.99,
        ),
      ],
    );
  }
}

class GetCoinsWidget extends StatelessWidget {
  final String text;

  final double price;
  final int duration;
  const GetCoinsWidget({
    Key? key,
    required this.text,
    required this.price,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        decoration: BoxDecoration(
            color: const Color(0xFF1D0529),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 13,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(AssetManager.coin),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
            ),
            const Spacer(),
            Text(
              "USD $price",
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
    );
  }
}
