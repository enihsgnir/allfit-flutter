import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RewardPointRegistrationController extends GetxController {
  static RewardPointRegistrationController get to => Get.find();

  final codeEdit = TextEditingController();
  final _codeText = "".obs;

  bool get canMoveOn => _codeText.trim().isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    codeEdit.addListener(() {
      _codeText.value = codeEdit.text;
    });
  }

  @override
  void onClose() {
    codeEdit.removeListener(() {});
    codeEdit.dispose();
  }
}
