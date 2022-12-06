// ignore_for_file: public_member_api_docs, sort_constructors_first

class AddYourStoryModel {
  String name;
  int age;
  int count;
  double km;
  String imgPath;
  String status;
  List<String> imgProfile;
  bool isSelect;
  AddYourStoryModel({
    required this.name,
    required this.age,
    required this.count,
    required this.km,
    required this.imgPath,
    required this.status,
    required this.imgProfile,
    this.isSelect = false,
  });
}
