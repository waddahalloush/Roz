// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:roz/Bloc/cubit/app_cubit.dart';
import 'package:roz/Core/constants/app_strings.dart';
import 'package:roz/Core/constants/asset_manager.dart';
import 'package:roz/Core/utils/Global%20Widgets/gradiant_button.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            iconTheme: Theme.of(context).iconTheme,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      AppStrings.access(context),
                      style: Theme.of(context).primaryTextTheme.headline1,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.plansSubscribe(context),
                        style: Theme.of(context).primaryTextTheme.headline6,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Image.asset(
                        AssetManager.heart,
                        height: 20,
                        width: 20,
                        fit: BoxFit.contain,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    decoration: BoxDecoration(
                        color: context.read<AppCubit>().isDark == 0
                            ? const Color(0xFF1D0529)
                            : Colors.white54,
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
                          style: Theme.of(context).primaryTextTheme.headline1,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      AppStrings.selectPlan(context),
                      style: Theme.of(context).primaryTextTheme.bodyText1,
                    ),
                  ),
                  const PlanWidget(
                    text: "100 Coins",
                    duration: 3,
                    price: 0.99,
                  ),
                  const PlanWidget(
                    text: "1000 Coins",
                    duration: 3,
                    price: 8.99,
                  ),
                  const PlanWidget(
                    text: "5000 Coins",
                    duration: 3,
                    price: 43.99,
                  ),
                  const PlanWidget(
                    text: "12000 Coins",
                    duration: 3,
                    price: 99.99,
                  ),
                  const PlanWidget(
                    text: "36500 Coins",
                    duration: 3,
                    price: 299.99,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GradiantButton(
                      text: AppStrings.continu(context), onpress: () {})
                ],
              ),
            ),
          )),
    );
  }
}

class PlanWidget extends StatelessWidget {
  final String text;

  final double price;
  final int duration;
  const PlanWidget({
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
            color: context.read<AppCubit>().isDark == 0
                ? const Color(0xFF1D0529)
                : Colors.white54,
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
              style: Theme.of(context).primaryTextTheme.headline2,
            ),
            const Spacer(),
            Text(
              "USD $price",
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
