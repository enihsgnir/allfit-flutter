import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  static SignInController get to => Get.find();

  final emailEdit = TextEditingController();
  final pwEdit = TextEditingController();

  @override
  void onClose() {
    emailEdit.dispose();
    pwEdit.dispose();
  }
}
