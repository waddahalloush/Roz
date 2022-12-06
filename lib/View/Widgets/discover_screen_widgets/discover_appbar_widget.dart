import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roz/Core/constants/app_strings.dart';
import 'package:roz/Core/constants/asset_manager.dart';
import 'package:roz/View%20Model/app_provider.dart';
import '../../../Core/utils/app_router.dart';

class DiscoverAppBarWidget extends StatelessWidget {
  const DiscoverAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 8,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 15,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(AssetManager.coin),
            ),
            Text(
              "25",
              style: Theme.of(context).primaryTextTheme.headline2,
            )
          ],
        ),
        const SizedBox(
          width: 15,
        ),
        InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {
            Navigator.pushNamed(context, AppRouter.plansRoute);
          },
          child: Image.asset(
            "assets/images/giphy.gif",
            width: 30,
            height: 30,
          ),
        ),
        const Spacer(),
        Align(
          alignment: Alignment.center,
          child: Text(
            AppStrings.discover(context),
            style: Theme.of(context).primaryTextTheme.headline2,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 30,
          child: IconButton(
            splashRadius: 15,
            icon: Icon(
              Icons.search,
              color: Theme.of(context).iconTheme.color,
              size: 20,
            ),
            onPressed: () {},
          ),
        ),
        SizedBox(
          width: 30,
          child: IconButton(
            splashRadius: 15,
            icon: Icon(
              Icons.settings,
              color: Theme.of(context).iconTheme.color,
              size: 20,
            ),
            onPressed: () {
              context.read<AppProvider>().openDrawer();
            },
          ),
        ),
        SizedBox(
          width: 30,
          child: IconButton(
            splashRadius: 15,
            padding: const EdgeInsets.all(0),
            icon: Badge(
              toAnimate: false,
              alignment: Alignment.topRight,
              animationType: BadgeAnimationType.fade,
              position: BadgePosition.topEnd(top: -10, end: -8),
              badgeContent: const Text(
                "3",
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              child: Icon(
                Icons.notifications,
                color: Theme.of(context).iconTheme.color,
                size: 20,
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, AppRouter.notifiacationRoute);
            },
          ),
        ),
      ],
    );
  }
}
