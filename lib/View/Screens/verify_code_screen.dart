// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:roz/Core/constants/app_strings.dart';
import 'package:roz/Core/utils/app_router.dart';
import 'package:roz/Core/utils/Global%20Widgets/gradiant_button.dart';

import '../../Core/utils/Global Widgets/gradiant_text.dart';
import '../Widgets/verify_code_widgets/otp_widget.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Scaffold(
        backgroundColor: const Color(0xFFEEFCFF),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFFEEFCFF),
          leading: IconButton(
            icon: const Icon(FontAwesomeIcons.arrowLeft),
            color: Theme.of(context).iconTheme.color,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppStrings.verify(context),
              style: const TextStyle(
                  fontSize: 22,
                  
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF33196B)),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              AppStrings.verifySub1(context),
              style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF33196B),
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              AppStrings.verifySub2(context),
              style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF33196B),
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const OTPWidget(),
            const SizedBox(
              height: 20,
            ),
            GradiantButton(
                text: AppStrings.submit(context),
                onpress: () {
                  Navigator.of(context).pushNamed(AppRouter.profileRoute);
                }),
            const SizedBox(
              height: 20,
            ),
            GradiantTextButton(
              size: 20,
              text: AppStrings.resendOtp(context),
              onPress: () {},
            )
          ],
        ),
      ),
    );
  }
}
