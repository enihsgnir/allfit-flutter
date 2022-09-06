import 'package:get/get.dart';

enum Category {
  tShirt,
  dressShirt,
  pants,
  onePieceDress,
  skirt,
}

class OrderController extends GetxController {
  static OrderController get to => Get.find();

  final icon = ["t_shirt", "dress_shirt", "pants", "one_piece_dress", "skirt"];
  final title = ["티셔츠/맨투맨", "셔츠/블라우스", "바지", "원피스", "치마"];

  final _category = "".obs;
  String get category => _category.value;
  set category(String value) => _category.value = value;

  final _point = "".obs;
  String get point => _point.value;
  set point(String value) => _point.value = value;
}
