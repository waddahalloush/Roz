// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:roz/Core/constants/app_strings.dart';

import 'package:roz/Core/utils/Global%20Widgets/login_formfield.dart';

import '../../Core/utils/Global Widgets/gradiant_button.dart';
import '../Widgets/account_info_widget.dart';

class RozAppSettingsScreen extends StatelessWidget {
  const RozAppSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
   
   
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: Theme.of(context).iconTheme,
          title: Text(
            AppStrings.rozsetting(context),
            style: Theme.of(context).primaryTextTheme.headline1,
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                LoginFormField(
                    hint: AppStrings.chgUsernm(context), controller: nameController),
                LoginFormField(
                    hint: AppStrings.chgUserPs(context),
                    controller: passwordController),
                AccountInfoWidget(
                  icon: Icons.calendar_month_rounded,
                  title: AppStrings.pickAge(context),
                  onTap: () {
                    var age = 25;

                    showMaterialNumberPicker(
                      headerColor: Colors.indigo,
                      headerTextColor: Colors.white,
                      buttonTextColor: Colors.indigo,
                      context: context,
                      title: AppStrings.pickAge(context),
                      maxNumber: 100,
                      minNumber: 14,
                      selectedNumber: age,
                    );
                  },
                ),
                AccountInfoWidget(
                  icon: Icons.monetization_on,
                  title: AppStrings.pickCallCost(context),
                  onTap: () {
                    int cost = 10;

                    showMaterialNumberPicker(
                      headerColor: Colors.indigo,
                      headerTextColor: Colors.white,
                      buttonTextColor: Colors.indigo,
                      context: context,
                      title: AppStrings.pickCallCost(context),
                      maxNumber: 200,
                      minNumber: cost,
                      selectedNumber: cost,
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                GradiantButton(text: AppStrings.save(context), onpress: () {}),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    "User ID : 6575478",
                    style: Theme.of(context).primaryTextTheme.subtitle1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

