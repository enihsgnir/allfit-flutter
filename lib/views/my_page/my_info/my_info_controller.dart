import 'package:allfit_flutter/domains/user/user.dart';
import 'package:allfit_flutter/domains/user/user_repository.dart';
import 'package:allfit_flutter/views/main_controller.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyInfoController extends GetxController {
  static MyInfoController get to => Get.find();

  late final Rx<User> _user;
  User get user => _user.value;
  set user(User value) => _user.value = value;

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

  final nicknameEdit = TextEditingController();
  final wayToEnterEdit = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _user = MainController.to.currentUser!.obs;
  }

  @override
  void onClose() {
    emailEdit.dispose();
    pwEdit.dispose();
    nicknameEdit.dispose();
    wayToEnterEdit.dispose();
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
    final newUser = await userRepository.updateOne(
      user.id,
      data: {"email": newEmail},
    );
    MainController.to.currentUser = newUser;
    user = newUser;
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

  Future<void> changeInfo() async {
    String? nickname;
    String? wayToEnter;

    if (nicknameEdit.text.isNotEmpty) {
      nickname = nicknameEdit.text;
    }
    if (wayToEnterEdit.text.isNotEmpty) {
      wayToEnter = wayToEnterEdit.text;
    }

    await userRepository.updateInfo(
      user.id,
      nickname: nickname,
      wayToEnter: wayToEnter,
    );
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
