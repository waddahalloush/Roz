import 'package:flutter/material.dart';
import 'package:roz/Core/constants/app_strings.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: Theme.of(context).iconTheme,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppStrings.notification(context),
                style: Theme.of(context).primaryTextTheme.headline1,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 20),
                child: Text(
                  AppStrings.notificationSub(context),
                  style: Theme.of(context).primaryTextTheme.subtitle1,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (ctx, index) {
                    return const NotificationWidget();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 31,
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/sample2.png',
                  ),
                  backgroundColor: Colors.transparent,
                  radius: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Myley Corbyn liked you',
                      style: Theme.of(context).primaryTextTheme.bodyText1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 4),
                      child: Text(
                        'Hi Mathew, Myley here.\nWould you like to chat? waiting..',
                        style: Theme.of(context).primaryTextTheme.subtitle1,
                      ),
                    ),
                    Text(
                      '12:20 AM | 29.04.2022',
                      style: Theme.of(context).primaryTextTheme.subtitle1,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 12, bottom: 12),
          height: 1.5,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFFA457E),
                Color(0xFF7B49FF),
              ],
            ),
          ),
          child: const Divider(),
        ),
      ],
    );
  }
}
