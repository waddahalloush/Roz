import 'package:flutter/material.dart';

import '../Models/video_call_gift_model.dart';

class VideoCallProvider extends ChangeNotifier{
    ScrollController scrollController = ScrollController();
  TextEditingController chatController = TextEditingController();
  List<String> chatMessageList = [];
  List<String> chatGifList = [];
  List<VideoCallGiftModel> chatemojiList = [];
  bool isVisible = true;
  bool userPhotosIsSelected = false;
  bool volumMute = false;



  void changeChatIconsVisilility() {
    isVisible = !isVisible;
    notifyListeners();
  }


  void muteVolume() {
    volumMute = !volumMute;
    notifyListeners();
  }

  void chatMessageInVideoCall(String value) {
    chatMessageList.add(value);

    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.bounceInOut);
    chatController.clear();
   notifyListeners();
  }

  void chatGifInVideoCall(String gif, String emoji, String disc) async {
    chatGifList.add(gif);

    chatemojiList.add(VideoCallGiftModel(emoji: emoji, disc: disc));
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.bounceInOut);
    notifyListeners();
    await Future.delayed(
      const Duration(milliseconds: 3500),
    );
    chatGifList.removeLast();

    notifyListeners();
    await Future.delayed(
      const Duration(milliseconds: 5000),
    );
    chatemojiList.removeLast();

   notifyListeners();
  }
}