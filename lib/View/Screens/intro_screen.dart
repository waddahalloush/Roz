// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:roz/Core/constants/app_strings.dart';
import 'package:roz/Core/utils/app_router.dart';
import 'package:roz/Core/utils/Global%20Widgets/gradiant_text.dart';

import '../../Core/constants/asset_manager.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFEEFCFF),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  AssetManager.introLight,
                  fit: BoxFit.contain,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 20, bottom: 20, right: 5),
                      child: GradiantTextButton(
                          size: 25,
                          text: AppStrings.getStarted(context),
                          onPress: () {
                            Navigator.of(context).pushReplacementNamed(
                                AppRouter.startDatingRoute);
                          })),
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[
                          Color.fromARGB(255, 245, 45, 249),
                          Color.fromARGB(255, 114, 33, 243)
                        ],
                        tileMode: TileMode.decal,
                      ).createShader(bounds);
                    },
                    child: const Icon(
                      FontAwesomeIcons.arrowRightLong,
                      color: Color.fromARGB(255, 245, 45, 249),
                      size: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
