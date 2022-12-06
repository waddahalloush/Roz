// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:roz/Core/constants/app_strings.dart';

import '../Widgets/block_listtile_widget.dart';

class BlockListScreen extends StatelessWidget {
  const BlockListScreen({Key? key}) : super(key: key);

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
            AppStrings.settingBlock(context),
            style: Theme.of(context).primaryTextTheme.headline1,
          ),
        ),
        body: ListView(children: const [
          BlockListTileWidget(
            image: 'assets/images/card_img_2.png',
            name: 'Myley Corbyon',
            time: "11,44 AM",
          )
        ]),
      ),
    );
  }
}
