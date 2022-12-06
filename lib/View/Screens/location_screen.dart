import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:roz/Core/constants/asset_manager.dart';
import 'package:roz/Core/utils/app_router.dart';
import 'package:roz/Core/utils/Global%20Widgets/login_formfield.dart';
import 'package:roz/Core/utils/Global%20Widgets/gradiant_button.dart';
import 'package:roz/Core/utils/media_query_ex.dart';

import '../../Core/constants/app_strings.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController locationController = TextEditingController();
    TextEditingController newLocationController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFEEFCFF),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: IconButton(
            icon: const Icon(FontAwesomeIcons.arrowLeft),
            color: Theme.of(context).iconTheme.color,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset("assets/lottie/location.json",
                width: context.width, height: context.height * 0.2),
            Text(
              AppStrings.location(context),
              style: const TextStyle(
                  fontSize: 22,
                 
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF33196B)),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              AppStrings.locationAdvice(context),
              style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF33196B),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              AppStrings.locationCurrent(context),
              style: const TextStyle(
                  fontSize: 15,
                 
                  color: Colors.indigo,
                  fontWeight: FontWeight.w900),
            ),
            LoginFormField(
                hint: "Florida , US", controller: locationController),
            LoginFormField(
                hint: "Search New Location", controller: newLocationController),
            GradiantButton(
                text: AppStrings.continu(context),
                onpress: () {
                  Navigator.of(context).pushNamed(AppRouter.homeRoute);
                }),
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppStrings.poweredBy(context),
                      style: const TextStyle(
                        fontSize: 11,
                        
                        color: Color(0xFFDD3663)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4, top: 4),
                      child: Image.asset(
                        AssetManager.google,
                        height: 25,
                        width: 70,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
