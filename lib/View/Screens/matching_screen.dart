import 'package:flutter/material.dart';
import 'package:roz/Core/utils/Global%20Widgets/gradiant_text.dart';
import 'package:roz/Core/utils/app_router.dart';
import 'package:roz/Core/utils/media_query_ex.dart';

import '../../Core/constants/app_strings.dart';

class MatchingScreen extends StatelessWidget {
  const MatchingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/match_new_remove.png",
                width: context.width, height: context.height * 0.50),
            Text(
              AppStrings.congrats(context),
              style: Theme.of(context).primaryTextTheme.headline1,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              AppStrings.match(context),
              style: Theme.of(context).primaryTextTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Belle and You both Liked each other",
              style: Theme.of(context).primaryTextTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRouter.videocallRoute);
              },
              child: Text(
                AppStrings.conversation(context),
                style: const TextStyle(
                    color: Color(0xFFDD3663),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                   ),
              ),
            ),
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GradiantTextButton(
                  text: AppStrings.keepDating(context),
                  size: 20,
                  onPress: () {
                    Navigator.pop(context);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
