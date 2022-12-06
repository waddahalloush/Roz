import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roz/Core/Theme/theme_cache_helper.dart';
import 'package:roz/Models/intrestes_model.dart';

import '../../Core/Localization/language_cache_helper.dart';
import '../../Core/constants/asset_manager.dart';
import '../../Models/add_your_story_model.dart';
import '../../Models/video_call_gift_model.dart';
import '../../View/Screens/add_message_screen.dart';
import '../../View/Screens/discover_screen.dart';
import '../../View/Screens/my_profile_screen.dart';
import '../../View/Screens/rating_screen.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  Locale locale = const Locale('en');
  int isDark = 0;
  File? image;
  File? imageProfile;
  File? video;
  ScrollController scrollController = ScrollController();
  TextEditingController chatController = TextEditingController();
  List<String> chatMessageList = [];
  List<String> chatGifList = [];
  List<VideoCallGiftModel> chatemojiList = [];
  bool isVisible = true;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int ci = 0;
  int bottomNavIndex = 0;
  bool userPhotosIsSelected = false;
  bool volumMute = false;
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
  List<String> selectedCountry = ["SY", "SA", "EG", "US", "TR"];
  List<Widget> screens = [
    const DescoverScreen(),
    const RatingScreen(),
    const AddMessageScreen(),
    MyProfileScreen()
  ];
  AppCubit() : super(InitialState());

  Future<void> getSavedTheme() async {
    isDark = await ThemeCacheHelper().getCachedThemeIndex();

    emit(ChangeThemeState());
  }

  Future<void> getSavedLanguage() async {
    locale = Locale(await LanguageCacheHelper().getCachedLanguageCode());

    emit(ChangeLanguageState());
  }

  Future<void> changeTheme(int x) async {
    isDark = x;
    await ThemeCacheHelper().cacheTheme(isDark);

    emit(ChangeThemeState());
  }

  Future<void> changeLanguage(String languageCode) async {
    await LanguageCacheHelper().cacheLanguageCode(languageCode);
    locale = Locale(languageCode);
    emit(ChangeLanguageState());
  }

  void changeIsClickedIntrest(BuildContext context, int i) {
    intrestesList(context)[i].isClicked = true;
    log(intrestesList(context)[i].isClicked.toString());
    emit(ChangeIntrestsState());
  }

  void changeNav(int i) {
    ci = i;
    bottomNavIndex = i;

    emit(ChangeNavState());
  }

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
    emit(OpenDrawerState());
  }

  void changeChatIconsVisilility() {
    isVisible = !isVisible;
    emit(ChangeChatIconsVisililityState());
  }

  void changeCountryFlag(String isoCode) {
    selectedCountry.contains(isoCode)
        ? selectedCountry.remove(isoCode)
        : selectedCountry.add(isoCode);
    emit(ChangeCountryFlagState());
  }

  Future upLoadImage(BuildContext context) async {
    try {
      var pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;
      image = File(pickedImage.path);
      emit(UploadImageState());
    } on PlatformException {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Failed To Pick Image")));
    }
  }

  Future upLoadImageProfile(BuildContext context) async {
    try {
      var pickedImageProfile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImageProfile == null) return;
      imageProfile = File(pickedImageProfile.path);
    } on PlatformException {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Failed To Pick Image")));
    }
    emit(UploadImageProfileState());
  }

  Future upLoadVideo(BuildContext context) async {
    try {
      var pickedVideo =
          await ImagePicker().pickVideo(source: ImageSource.gallery);
      if (pickedVideo == null) return;
      video = File(pickedVideo.path);
      emit(UploadVideoState());
    } on PlatformException {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Failed To Pick Video")));
    }
  }

  void muteVolume() {
    volumMute = !volumMute;
    emit(VolumeMuteState());
  }

  void chatMessageInVideoCall(String value) {
    chatMessageList.add(value);

    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.bounceInOut);
    chatController.clear();
    emit(ChatMessageInVideoCallState());
  }

  void chatGifInVideoCall(String gif, String emoji, String disc) async {
    chatGifList.add(gif);

    chatemojiList.add(VideoCallGiftModel(emoji: emoji, disc: disc));
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.bounceInOut);
    emit(ChatGifInVideoCallState());
    await Future.delayed(
      const Duration(milliseconds: 3500),
    );
    chatGifList.removeLast();

    emit(ChatGifInVideoCallState());
    await Future.delayed(
      const Duration(milliseconds: 5000),
    );
    chatemojiList.removeLast();

    emit(ChatGifInVideoCallState());
  }
}
