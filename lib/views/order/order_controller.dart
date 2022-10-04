import 'package:allfit_flutter/domains/order/order.dart';
import 'package:allfit_flutter/domains/order/order_repository.dart';
import 'package:allfit_flutter/domains/tailor/tailor.dart';
import 'package:allfit_flutter/domains/tailor/tailor_repository.dart';
import 'package:allfit_flutter/views/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get to => Get.find();

  final categoryListEn = [
    "t_shirt",
    "dress_shirt",
    "pants",
    "one_piece_dress",
    "skirt",
  ];
  final categoryListKo = [
    "티셔츠/맨투맨",
    "셔츠/블라우스",
    "바지",
    "원피스",
    "치마",
  ];

  final partListEn = [
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

  final _pointsCache = <OrderPoint>[].obs;
  List<OrderPoint> get pointsCache => _pointsCache;
  set pointsCache(List<OrderPoint> value) => _pointsCache.value = value;

  final _categoryIndexCache = 0.obs;
  int get categoryIndexCache => _categoryIndexCache.value;
  set categoryIndexCache(int value) => _categoryIndexCache.value = value;

  final _partIndexCache = 0.obs;
  int get partIndexCache => _partIndexCache.value;
  set partIndexCache(int value) => _partIndexCache.value = value;

  final _valueCache = 0.0.obs;
  double get valueCache => _valueCache.value;
  set valueCache(double value) => _valueCache.value = value;

  final _costCache = 0.obs;
  int get costCache => _costCache.value;
  set costCache(int value) => _costCache.value = value;

  int get alterCost {
    return pointsCache.fold(
      0,
      (previousValue, element) => previousValue + element.cost,
    );
  }

  final _deliveryFee = 3000.obs;
  int get deliveryFee => _deliveryFee.value;
  set deliveryFee(int value) => _deliveryFee.value = value;

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

  String getCurrentCategoryEn() {
    return categoryListEn[categoryIndexCache];
  }

  String getCurrentCategoryKo() {
    return categoryListKo[categoryIndexCache];
  }

  String getPartEn(int index) {
    return partListEn[categoryIndexCache][index];
  }

  String getPartKo(int index) {
    return partListKo[categoryIndexCache][index];
  }

  String getCurrentPartKo() {
    return partListKo[categoryIndexCache][partIndexCache];
  }

  void addPoint() {
    pointsCache.add(
      OrderPoint(
        part: getPartKo(partIndexCache),
        value: valueCache,
        cost: costCache,
      ),
    );
    partIndexCache = 0;
    valueCache = 0.0;
    costCache = 0;
  }

  void removePoint(OrderPoint point) {
    pointsCache.remove(point);
  }

  Future<void> createOrder() async {
    final user = MainController.to.currentUser;
    if (user == null) {
      return;
    }

    await orderRepository.createOne(
      Order(
        id: "",
        userId: user.id,
        tailorId: tailorId,
        items: [
          OrderItem(
            category: getCurrentCategoryKo(),
            points: pointsCache,
          ),
        ],
        address: user.addresses[user.mainAddressIndex],
        pickUpSchedule: pickUpSchedule,
        serviceCategory: "1회 이용수선서비스",
        deliveryFee: deliveryFee,
        discount: 0,
        createdAt: DateTime.now(),
      ),
    );
  }
}
