import 'package:flutter/material.dart';

import '../Core/constants/asset_manager.dart';
import '../Models/add_your_story_model.dart';

class DiscoverProvider extends ChangeNotifier{
  List<String> selectedCountry = ["SY", "SA", "EG", "US", "TR"];
  List<AddYourStoryModel> storyList = [
    AddYourStoryModel(
        name: 'Belle Benson',
        age: 28,
        km: 1.5,
        status: "Private",
        imgPath: 'assets/images/card_img_0.png',
        count: 35,
        imgProfile: [
          AssetManager.imgProfile0,
          AssetManager.imgProfile1,
        ]),
    AddYourStoryModel(
        name: 'Ruby Diaz',
        age: 33,
        km: 1.2,
        status: "Private",
        imgPath: 'assets/images/card_img_1.png',
        count: 81,
        imgProfile: [
          AssetManager.imgProfile2,
          AssetManager.imgProfile3,
          AssetManager.imgProfile4,
        ]),
    AddYourStoryModel(
        name: 'Myley Corbyon',
        age: 23,
        km: 1.5,
        status: "Online",
        imgPath: 'assets/images/card_img_2.png',
        count: 49,
        imgProfile: []),
    AddYourStoryModel(
        name: 'Tony Z',
        age: 25,
        km: 2,
        status: "Offline",
        imgPath: 'assets/images/card_img_1.png',
        count: 29,
        imgProfile: [
          AssetManager.imgProfile5,
          AssetManager.imgProfile6,
          AssetManager.imgProfile7,
          AssetManager.imgProfile8,
          AssetManager.imgProfile2,
          AssetManager.imgProfile3,
          AssetManager.imgProfile4,
        ]),
    AddYourStoryModel(
        name: 'Ruby Raman',
        age: 30,
        km: 1.6,
        status: "Offline",
        imgPath: 'assets/images/card_img_4.png',
        count: 50,
        imgProfile: [
          AssetManager.imgProfile9,
        ]),
  ];
}