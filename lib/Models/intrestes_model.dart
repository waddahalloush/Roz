// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:roz/Core/constants/app_strings.dart';

class IntrestsModel {
  final String name;
  final IconData icon;
  late bool isClicked;

  IntrestsModel({
    required this.name,
    required this.icon,
    this.isClicked = false,
  });
}

List<IntrestsModel> intrestesList(BuildContext context) => [
      IntrestsModel(name: AppStrings.photog(context), icon: Icons.photo_camera),
      IntrestsModel(
        name: AppStrings.cook(context),
        icon: MdiIcons.cookie,
      ),
      IntrestsModel(
          name: AppStrings.games(context), icon: Icons.videogame_asset),
      IntrestsModel(name: AppStrings.music(context), icon: MdiIcons.music),
      IntrestsModel(
          name: AppStrings.travil(context),
          icon: Icons.travel_explore_outlined),
      IntrestsModel(
          name: AppStrings.shopping(context),
          icon: Icons.shopping_bag_outlined),
      IntrestsModel(
          name: AppStrings.speech(context), icon: MdiIcons.microphone),
      IntrestsModel(name: AppStrings.art(context), icon: Icons.palette),
      IntrestsModel(name: AppStrings.swim(context), icon: MdiIcons.swim),
      IntrestsModel(name: AppStrings.drink(context), icon: Icons.wine_bar),
      IntrestsModel(
          name: AppStrings.sport(context), icon: Icons.sports_rounded),
      IntrestsModel(name: AppStrings.fitniss(context), icon: MdiIcons.run),
    ];
