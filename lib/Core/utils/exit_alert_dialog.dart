import 'package:flutter/material.dart';
import 'package:roz/Core/constants/app_strings.dart';
import 'package:roz/Core/utils/app_router.dart';

Future<bool> showExitAlert(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            contentPadding: const EdgeInsets.symmetric(horizontal: 50),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Theme.of(context).primaryColor),
                borderRadius: const BorderRadius.all(Radius.circular(32.0))),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFFDD3663)),
                  child: const Icon(
                    Icons.call_end,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.question_answer,
                      size: 15,
                      color: Colors.indigo,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      AppStrings.exitApp(context),
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo),
                    ),
                  ],
                ),
              ],
            ),
            titlePadding: const EdgeInsets.symmetric(horizontal: 30),
            content: Text(
              AppStrings.exitAppSub(context),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppRouter.homeRoute);
                },
                child: Text(
                  AppStrings.continu(context),
                  style: const TextStyle(
                      color: Colors.purple,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  AppStrings.skip(context),
                  style: const TextStyle(
                      color: Colors.purple,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ));
  return Future.value(true);
}
