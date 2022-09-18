import 'package:allfit_flutter/domains/user/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  static MainController get to => Get.find();

  final _currentUser = Rxn<User>();
  User? get currentUser => _currentUser.value;
  set currentUser(User? value) => _currentUser.value = value;

  final _index = 0.obs;
  int get index => _index.value;
  set index(int value) => _index.value = value;

  final addressEdit = TextEditingController();

  @override
  void onClose() {
    addressEdit.dispose();
  }
}
