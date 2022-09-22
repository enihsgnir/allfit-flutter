import 'package:allfit_flutter/domains/user/user_repository.dart';
import 'package:allfit_flutter/views/main_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyInfoController extends GetxController {
  static MyInfoController get to => Get.find();

  final emailEdit = TextEditingController();

  final _isEmailEditing = false.obs;
  bool get isEmailEditing => _isEmailEditing.value;
  set isEmailEditing(bool value) => _isEmailEditing.value = value;

  final passwordEdit = TextEditingController();

  final _isPasswordEditing = false.obs;
  bool get isPasswordEditing => _isPasswordEditing.value;
  set isPasswordEditing(bool value) => _isPasswordEditing.value = value;

  final _isInfoEditing = false.obs;
  bool get isInfoEditing => _isInfoEditing.value;
  set isInfoEditing(bool value) => _isInfoEditing.value = value;

  @override
  void onClose() {
    emailEdit.dispose();
    passwordEdit.dispose();
  }

  Future<void> withdraw() async {
    final authUser = FirebaseAuth.instance.currentUser;
    final user = MainController.to.currentUser;
    if (authUser == null || user == null) {
      return;
    }

    await authUser.delete();
    await userRepository.withdraw(user.id);
    await MainController.to.signOut();
  }
}
