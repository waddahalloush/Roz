import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:roz/Core/constants/app_strings.dart';

import '../../Core/utils/app_router.dart';
import '../Widgets/account_info_widget.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: Theme.of(context).iconTheme,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          title: Text(
            AppStrings.settingContact(context),
            style: Theme.of(context).primaryTextTheme.headline1,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Lottie.asset("assets/lottie/support.json"),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.mail,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("rozcompany038@gmail.com",
                      style: Theme.of(context).primaryTextTheme.headline2),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.call,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "+39",
                    style: Theme.of(context).primaryTextTheme.headline2,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.whatsapp,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("+39",
                      style: Theme.of(context).primaryTextTheme.headline2),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              AccountInfoWidget(
                icon: Icons.local_fire_department_rounded,
                title: AppStrings.settingClient(context),
                onTap: () {
                  Navigator.of(context).pushNamed(AppRouter.uploadIdRoute);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
