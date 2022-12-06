// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:roz/Core/constants/app_strings.dart';
import 'package:roz/Core/constants/asset_manager.dart';
import 'package:roz/Core/utils/app_router.dart';
import 'package:roz/Core/utils/media_query_ex.dart';

import '../../Core/utils/Global Widgets/language_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerLeft, child: LanguageWidget()),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 70),
              child: Image.asset("assets/images/fullLogo.png",
                  fit: BoxFit.cover,
                  width: context.width,
                  height: context.height * 0.2),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: [
                  Flexible(
                    child: Container(
                      height: 1,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      AppStrings.signWith(context),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      height: 1,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    heroTag: "s",
                    backgroundColor: Colors.white,
                    onPressed: () {
                      
                      Navigator.pushReplacementNamed(
                          context, AppRouter.homeRoute);
                    },
                    child: Image.asset(
                      AssetManager.googleLogo,
                      height: 30,
                      width: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  FloatingActionButton(
                      heroTag: "w",
                      backgroundColor: Colors.indigoAccent,
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, AppRouter.homeRoute);
                      },
                      child: const Icon(
                        Icons.facebook,
                        size: 50,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
              child: Row(
                children: [
                  Flexible(
                    child: Container(
                      height: 1,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      AppStrings.or(context),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      height: 1,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRouter.emailloginRoute);
                },
                child: Text(
                  AppStrings.email(context),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                )),
            const Expanded(
              child: SizedBox(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRouter.termsRoute);
                  },
                  child: Text(
                    AppStrings.terms(context),
                    style:
                        const TextStyle(fontSize: 11, color: Color(0xFFDD3663)),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
