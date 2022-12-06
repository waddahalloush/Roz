import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class MyProfileProvider extends ChangeNotifier{
  File? imageProfile;
  File? video;
  File? image;
  void fetchMyVideos(){}
  void fetchMyImages(){}
  void fetchMyStatus(){}
    
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
    notifyListeners();
  }
    Future upLoadVideo(BuildContext context) async {
    try {
      var pickedVideo =
          await ImagePicker().pickVideo(source: ImageSource.gallery);
      if (pickedVideo == null) return;
      video = File(pickedVideo.path);
      notifyListeners();
    } on PlatformException {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Failed To Pick Video")));
    }
  }
    Future upLoadImage(BuildContext context) async {
    try {
      var pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;
      image = File(pickedImage.path);
     notifyListeners();
    } on PlatformException {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Failed To Pick Image")));
    }
  }
}