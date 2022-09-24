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

  final pwEdit = TextEditingController();

  final _isPwEditing = false.obs;
  bool get isPwEditing => _isPwEditing.value;
  set isPwEditing(bool value) => _isPwEditing.value = value;

  final _isInfoEditing = false.obs;
  bool get isInfoEditing => _isInfoEditing.value;
  set isInfoEditing(bool value) => _isInfoEditing.value = value;

  @override
  void onClose() {
    emailEdit.dispose();
    pwEdit.dispose();
  }

  void willEditEmail({required bool willOpen}) {
    emailEdit.text = "";

    isEmailEditing = willOpen;
    isPwEditing = false;
    isInfoEditing = false;
  }

  Future<void> changeEmail(String newEmail) async {
    final authUser = FirebaseAuth.instance.currentUser;
    if (authUser == null) {
      return;
    }

    await authUser.updateEmail(newEmail);
  }

  void willEditPassword({required bool willOpen}) {
    pwEdit.text = "";

    isEmailEditing = false;
    isPwEditing = willOpen;
    isInfoEditing = false;
  }

  Future<void> changePassword(String newPassword) async {
    final authUser = FirebaseAuth.instance.currentUser;
    if (authUser == null) {
      return;
    }

    await authUser.updatePassword(newPassword);
  }

  void willEditInfo({required bool willOpen}) {
    isEmailEditing = false;
    isPwEditing = false;
    isInfoEditing = willOpen;
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
