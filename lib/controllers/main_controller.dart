import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  static MainController get to => Get.find();

  final _index = 0.obs;
  int get index => _index.value;
  set index(int value) => _index.value = value;

  final addressEdit = TextEditingController();

  @override
  void onClose() {
    addressEdit.dispose();
  }
}
