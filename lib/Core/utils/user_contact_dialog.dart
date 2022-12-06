import 'package:flutter/material.dart';
import 'package:roz/Core/constants/app_strings.dart';
import 'package:roz/Core/utils/media_query_ex.dart';

import '../constants/asset_manager.dart';

Future<bool> userContactDialog(
    BuildContext context, String image, VoidCallback onContinue) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            backgroundColor: Colors.transparent,
            content: Container(
              alignment: Alignment.center,
              height: context.height / 1.6,
              width: context.width - 20,
              padding: const EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                      colors: [Colors.pinkAccent, Colors.red],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight)),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage(image),
                    backgroundColor: Colors.transparent,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      AppStrings.privateCall(context),
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                  ),
                  Text(
                    AppStrings.callCost(context),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    AppStrings.callShort(context),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 40,
                      width: 200,
                      padding: const EdgeInsets.all(1),
                      color: Colors.white,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            AppStrings.myCoin(context),
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: Colors.deepPurple),
                          ),
                          const CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 18,
                            backgroundImage: AssetImage(AssetManager.coin),
                          ),
                          const Text(
                            "25",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: Colors.deepPurple),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            AppStrings.skip(context),
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: onContinue,
                          child: Text(
                            AppStrings.continu(context),
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            contentPadding: const EdgeInsets.all(0.0),
          ));
  return Future.value(true);
}
