import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:roz/Core/constants/app_strings.dart';
import 'package:roz/Core/utils/media_query_ex.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppStrings.settingPrivacy(context),
            style: Theme.of(context).primaryTextTheme.headline1,
          ),
          iconTheme: Theme.of(context).iconTheme,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
        ),
        body: Center(
          child: Lottie.asset("assets/lottie/contract.json",
              width: context.width, height: context.height),
        ),
      ),
    );
  }
}
