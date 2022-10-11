import 'dart:io';

import 'package:allfit_flutter/domains/order/order.dart';
import 'package:allfit_flutter/domains/order/order_repository.dart';
import 'package:allfit_flutter/domains/tailor/tailor.dart';
import 'package:allfit_flutter/domains/tailor/tailor_repository.dart';
import 'package:allfit_flutter/utils/storage.dart';
import 'package:allfit_flutter/views/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get to => Get.find();

  final categoryListKo = [
    "티셔츠/맨투맨",
    "셔츠/블라우스",
    "바지",
    "원피스",
    "치마",
  ];
  final partListKo = [
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
  final prices = [
    [7500, 7500, 9500, 8000, 10000, 3000],
    [14500, 14500, 14500, 14500, 11500, 7500, 3000],
    [14500, 14500, 14500, 5500, 12500, 11500, 3000],
    [14500, 14500, 14500, 17500, 14500, 3000],
    [14500, 14500, 14500, 14500, 3000],
  ];

  final _pointsCache = <OrderPoint>[].obs;
  List<OrderPoint> get pointsCache => _pointsCache;
  set pointsCache(List<OrderPoint> value) => _pointsCache.value = value;

  final _categoryIndexCache = 0.obs;
  int get categoryIndexCache => _categoryIndexCache.value;
  set categoryIndexCache(int value) => _categoryIndexCache.value = value;

  String get currentCategoryKo => categoryListKo[categoryIndexCache];

  final _itemImage = Rxn<File>();
  File? get itemImage => _itemImage.value;
  set itemImage(File? value) => _itemImage.value = value;

  final _partIndexCache = 0.obs;
  int get partIndexCache => _partIndexCache.value;
  set partIndexCache(int value) => _partIndexCache.value = value;

  String get currentPartKo => partListKo[categoryIndexCache][partIndexCache];

  final _valueCache = 5.0.obs;
  double get valueCache => _valueCache.value;
  set valueCache(double value) => _valueCache.value = value;

  int get alterCost {
    return pointsCache.fold(
      0,
      (previousValue, element) => previousValue + element.cost,
    );
  }

  final deliveryFee = 3000;

  int get totalCost => alterCost + deliveryFee;

  final _tailors = <Tailor>[].obs;
  List<Tailor> get tailors => _tailors;
  set tailors(List<Tailor> value) => _tailors.value = value;

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
  Future<void> onReady() async {
    tailors = await tailorRepository.getAll();
  }

  @override
  void onClose() {
    extraEdit.dispose();
  }

  void addPoint() {
    pointsCache.add(
      OrderPoint(
        part: currentPartKo,
        value: valueCache,
        cost: prices[categoryIndexCache][partIndexCache],
      ),
    );
    partIndexCache = 0;
    valueCache = 5.0;
  }

  void modifyPoint(OrderPoint point) {
    final index = pointsCache.indexOf(point);
    pointsCache
      ..removeAt(index)
      ..insert(index, point.copyWith(value: valueCache));
    valueCache = 0.0;
  }

  void removePoint(OrderPoint point) {
    pointsCache.remove(point);
  }

  Future<void> createOrder() async {
    final user = MainController.to.currentUser;
    if (user == null) {
      return;
    }

    final order = await orderRepository.createOne(
      Order(
        id: "",
        userId: user.id,
        tailorId: tailorId,
        items: [
          OrderItem(
            category: currentCategoryKo,
            points: pointsCache,
          ),
        ],
        address: user.addresses[user.mainAddressIndex],
        pickUpSchedule: pickUpSchedule,
        serviceCategory: user.service.category,
        deliveryFee: deliveryFee,
        discount: 0,
        createdAt: DateTime.now(),
      ),
    );

    final itemImage = this.itemImage;
    if (itemImage != null) {
      Storage.uploadImage(
        newPath: "order_image/${order.id}.png",
        image: itemImage,
      );
    }
  }
}
