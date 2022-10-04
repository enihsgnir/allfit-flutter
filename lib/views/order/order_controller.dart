import 'package:allfit_flutter/domains/order/order.dart';
import 'package:allfit_flutter/domains/order/order_repository.dart';
import 'package:allfit_flutter/views/main_controller.dart';
import 'package:flutter/material.dart';
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

  final icons = ["t_shirt", "dress_shirt", "pants", "one_piece_dress", "skirt"];
  final title = ["티셔츠/맨투맨", "셔츠/블라우스", "바지", "원피스", "치마"];

  final partListEng = [
    [
      "sleeve_length",
      "sleeve_width",
      "shoulder_width",
      "chest_width",
      "total_length",
      "accessory",
    ],
    [
      "sleeve_length",
      "sleeve_width",
      "shoulder_width",
      "chest_width",
      "total_length",
      "shoulder_pad",
      "accessory",
    ],
    [
      "waist_hips_width",
      "overall_pant_legs_width",
      "rise_length",
      "total_length",
      "partial_pant_legs_width",
      "pants_fly",
      "accessory",
    ],
    [
      "sleeve_length",
      "sleeve_width",
      "shoulder_width",
      "total_width",
      "total_length",
      "accessory",
    ],
    [
      "waist_width",
      "total_width",
      "total_length",
      "partial_width",
      "accessory",
    ],
  ];

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

  String get iconAssetName => icons[categoryIndex];

  final _categoryIndex = 0.obs;
  int get categoryIndex => _categoryIndex.value;
  set categoryIndex(int value) => _categoryIndex.value = value;

  String get category => title[categoryIndex];

  final _partIndex = 0.obs;
  int get partIndex => _partIndex.value;
  set partIndex(int value) => _partIndex.value = value;

  String get part => parts[categoryIndex][partIndex];

  String get partImageAssetName =>
      "${iconAssetName}_${partListEng[categoryIndex][partIndex]}";

  final _pointValue = 6.obs;
  int get pointValue => _pointValue.value;
  set pointValue(int value) => _pointValue.value = value;

  final _pointsCache = <OrderPoint>[].obs;
  List<OrderPoint> get pointsCache => _pointsCache;
  set pointsCache(List<OrderPoint> value) => _pointsCache.value = value;

  final _minCost = 12000.obs;
  int get minCost => _minCost.value;
  set minCost(int value) => _minCost.value = value;

  final _deliveryFee = 3000.obs;
  int get deliveryFee => _deliveryFee.value;
  set deliveryFee(int value) => _deliveryFee.value = value;

  int get totalCost => minCost + deliveryFee;

  final _tailorId = "".obs;
  String get tailorId => _tailorId.value;
  set tailorId(String value) => _tailorId.value = value;

  final _tailorName = "".obs;
  String get tailorName => _tailorName.value;
  set tailorName(String value) => _tailorName.value = value;

  final extraEdit = TextEditingController();
  String get extra => extraEdit.text.isEmpty ? "없음" : extraEdit.text;

  final _address = "".obs;
  String get address => _address.value;
  set address(String value) => _address.value = value;

  final _pickUpSchedule = DateTime.now().obs;
  DateTime get pickUpSchedule => _pickUpSchedule.value;
  set pickUpSchedule(DateTime value) => _pickUpSchedule.value = value;

  final _deliverySchedule = DateTime.now().obs;
  DateTime get deliverySchedule => _deliverySchedule.value;
  set deliverySchedule(DateTime value) => _deliverySchedule.value = value;

  @override
  void onClose() {
    extraEdit.dispose();
  }

  void addPoint({
    required String category,
    required double value,
    required int cost,
  }) {
    pointsCache.add(
      OrderPoint(
        category: category,
        value: value,
        cost: cost,
      ),
    );
  }

  Future<void> createOrder() async {
    await orderRepository.createOne(
      Order(
        id: "",
        userId: MainController.to.currentUser?.id ?? "",
        tailorId: tailorId,
        items: [
          OrderItem(
            points: [
              OrderPoint(
                category: category,
                value: pointValue.toDouble(),
                cost: minCost,
              ),
            ],
          ),
        ],
        address: address,
        pickUpSchedule: pickUpSchedule,
        serviceCategory: "1회 이용수선서비스",
        deliveryFee: deliveryFee,
        discount: 0,
        createdAt: DateTime.now(),
      ),
    );
  }
}
