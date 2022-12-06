import 'package:flutter/material.dart';

import '../Models/add_new_message_model.dart';

class MessageProvider extends ChangeNotifier{
  final List<String> circleImageList = [
      'assets/images/img_circle_0.png',
      'assets/images/img_circle_1.png',
      'assets/images/img_circle_2.png',
      'assets/images/img_circle_0.png',
      'assets/images/img_circle_1.png',
      'assets/images/img_circle_2.png',
    ];

    List<AddNewMessageModel> addNewMsgList = [
      AddNewMessageModel(
          name: 'Belle Benson',
          time: '03:45 PM',
          imgPath: 'assets/images/card_img_0.png',
          messageCount: 2),
      AddNewMessageModel(
          name: 'Ruby Diaz',
          time: '11:49 AM',
          imgPath: 'assets/images/card_img_1.png',
          messageCount: 3),
      AddNewMessageModel(
          name: 'Myley Corbyon',
          time: 'Yesterday',
          imgPath: 'assets/images/card_img_2.png',
          messageCount: 1),
      AddNewMessageModel(
          name: 'Tony Z',
          time: '11:30 PM',
          imgPath: 'assets/images/card_img_1.png',
          messageCount: 0),
      AddNewMessageModel(
          name: 'Ruby Raman',
          time: 'Yesterday',
          imgPath: 'assets/images/card_img_4.png',
          messageCount: 1),
    ];
  void addNewMessage(){}
  void fetchUserStory(){}
  void getAllMessages(){}
  void searchMessage(){}
}