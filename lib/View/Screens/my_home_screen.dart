// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc/cubit/app_cubit.dart';
import '../Widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return Scaffold(
            key: context.read<AppCubit>().scaffoldKey,
            drawer: const AppDrawer(),
            bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                type: BottomNavigationBarType.fixed,
                selectedIconTheme: const IconThemeData(color: Colors.white),
                currentIndex: context.read<AppCubit>().ci,
                onTap: (index) => context.read<AppCubit>().changeNav(index),
                unselectedIconTheme:
                    const IconThemeData(color: Colors.grey, size: 20),
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: [
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.dashboard),
                    label: "Home",
                    activeIcon: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const RadialGradient(
                          center: Alignment.topLeft,
                          radius: 0.5,
                          colors: <Color>[Colors.deepOrange, Colors.amber],
                          tileMode: TileMode.repeated,
                        ).createShader(bounds);
                      },
                      child: const Icon(Icons.dashboard),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.star),
                    label: "star",
                    activeIcon: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const RadialGradient(
                          center: Alignment.topLeft,
                          radius: 1.0,
                          colors: <Color>[Colors.white, Colors.amber],
                          tileMode: TileMode.mirror,
                        ).createShader(bounds);
                      },
                      child: const Icon(Icons.star),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Badge(
                        alignment: Alignment.topRight,
                        toAnimate: false,
                        animationType: BadgeAnimationType.fade,
                        position: BadgePosition.topEnd(top: -12, end: -12),
                        badgeContent: const Text(
                          "3",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        child: const Icon(Icons.chat)),
                    label: "Chat",
                    activeIcon: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const RadialGradient(
                          center: Alignment.topLeft,
                          radius: 1.0,
                          colors: <Color>[
                            Colors.greenAccent,
                            Colors.blueAccent
                          ],
                          tileMode: TileMode.mirror,
                        ).createShader(bounds);
                      },
                      child: Badge(
                          toAnimate: false,
                          alignment: Alignment.topRight,
                          animationType: BadgeAnimationType.fade,
                          position: BadgePosition.topEnd(top: -12, end: -12),
                          badgeContent: const Text(
                            "3",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          child: const Icon(Icons.chat)),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.account_circle),
                    label: "profile",
                    activeIcon: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const RadialGradient(
                          center: Alignment.topLeft,
                          radius: 1.0,
                          colors: <Color>[
                            Colors.blueAccent,
                            Color.fromARGB(255, 222, 105, 240)
                          ],
                          tileMode: TileMode.mirror,
                        ).createShader(bounds);
                      },
                      child: const Icon(Icons.account_circle),
                    ),
                  ),
                ]),
            body: context.read<AppCubit>().screens[context.read<AppCubit>().ci],
          );
        },
      ),
    );
  }
}
