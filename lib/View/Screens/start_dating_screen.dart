// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:roz/Core/constants/app_strings.dart';
import 'package:roz/Core/constants/asset_manager.dart';

import '../../Core/utils/app_router.dart';
import '../../Core/utils/Global Widgets/gradiant_button.dart';

class StartDatingScreen extends StatelessWidget {
  const StartDatingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFEEFCFF),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppStrings.onlineDating(context),
                style: const TextStyle(
                    color: Color(0xFFDD3663),
                    fontSize: 16,
                    fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              AppStrings.startDatingSub1(context),
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF33196B)),
            ),
            Text(
              AppStrings.startDatingSub2(context),
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF33196B)),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              AppStrings.startDatingSub3(context),
              style: const TextStyle(
                color: Color(0xFF5E50E5),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              AppStrings.playVideo(context),
              style: const TextStyle(
                  color: Color(0xFFDD3663),
                  fontSize: 14,
                  fontWeight: FontWeight.w900),
            ),
            Expanded(
              child: Image.asset(
                AssetManager.startDating,
                fit: BoxFit.fill,
              ),
            ),
            GradiantButton(
              text: AppStrings.startDating(context),
              onpress: () => Navigator.of(context)
                  .pushReplacementNamed(AppRouter.loginRoute),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    ));
  }
}
