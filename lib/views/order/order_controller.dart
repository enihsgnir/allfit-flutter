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

  // final parts = [
  //   [
  //     "sleeve_length",
  //     "sleeve_width",
  //     "shoulder_width",
  //     "chest_width",
  //     "total_length",
  //     "accessory",
  //   ],
  //   [
  //     "sleeve_length",
  //     "sleeve_width",
  //     "shoulder_width",
  //     "chest_width",
  //     "total_length",
  //     "shoulder_pad",
  //     "accessory",
  //   ],
  //   [
  //     "waist/hips_width",
  //     "overall_pant_legs_width",
  //     "rise_length",
  //     "total_length",
  //     "partial_pant_legs_width",
  //     "pants_fly",
  //     "accessory",
  //   ],
  //   [
  //     "sleeve_length",
  //     "sleeve_width",
  //     "shoulder_width",
  //     "totla_width",
  //     "total_length",
  //     "accessory",
  //   ],
  //   [
  //     "waist_width",
  //     "total_width",
  //     "total_length",
  //     "partial_width",
  //     "accessory",
  //   ],
  // ];

  final parts = [
    [
      "소매기장 줄임",
      "전체팔통 줄임",
      "어깨길이 줄임",
      "전체품 줄임",
      "총기장 줄임",
      "부속품 찢김, 수선",
    ],
    [
      "소매기장 줄임",
      "전체팔통 줄임",
      "어깨길이 줄임",
      "전체품 줄임",
      "총기장 줄임",
      "어깨패드 추가/제거/교체",
      "부속품 찢김, 수선",
    ],
    [
      "허리/힙 줄임",
      "전체통 줄임",
      "밑위 줄임",
      "기장 줄임",
      "부분통 줄임",
      "지퍼 교체",
      "부속품 찢김, 수선",
    ],
    [
      "소매기장 줄임",
      "전체팔통 줄임",
      "어깨길이 줄임",
      "전체품 줄임",
      "총기장 줄임",
      "부속품 찢김, 수선",
    ],
    [
      "허리/힙 줄임",
      "전체통 줄임",
      "기장 줄임",
      "부분통 줄임",
      "부속품 찢김, 수선",
    ],
  ];

  final _category = 0.obs;
  int get category => _category.value;
  set category(int value) => _category.value = value;

  final _part = 0.obs;
  int get part => _part.value;
  set part(int value) => _part.value = value;

  final _point = "".obs;
  String get point => _point.value;
  set point(String value) => _point.value = value;
}
