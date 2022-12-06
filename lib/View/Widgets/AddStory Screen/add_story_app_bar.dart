
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Bloc/cubit/app_cubit.dart';
import '../../../Core/utils/app_router.dart';

class AddStoryAppBar extends StatelessWidget {
  const AddStoryAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FloatingActionButton(
            mini: true,
            backgroundColor: Colors.pinkAccent,
            onPressed: () {},
            child: const Icon(
              Icons.add,
              color: Colors.white,
            )),
        const SizedBox(
          width: 8,
        ), Text(
                  "Add Your Story",
                  style: Theme.of(context).primaryTextTheme.headline2,
                ),
       
        const Spacer(),
      
        IconButton(
          splashRadius: 15,
          icon: Icon(
            Icons.search,
            color: Theme.of(context).iconTheme.color,
            size: 20,
          ),
          onPressed: () {},
        ),
        IconButton(
          splashRadius: 15,
          icon: Icon(
            Icons.settings,
            color: Theme.of(context).iconTheme.color,
            size: 20,
          ),
          onPressed: () {
            context.read<AppCubit>().openDrawer();
          },
        ),
        IconButton(
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
      ],
    );
  }
}
