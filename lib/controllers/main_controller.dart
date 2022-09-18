import 'package:allfit_flutter/domains/user/user.dart';
import 'package:allfit_flutter/domains/user/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  static MainController get to => Get.find();

  final _currentUser = Rxn<User>();
  User? get currentUser => _currentUser.value;
  set currentUser(User? value) => _currentUser.value = value;

  bool get isSignedIn => currentUser != null;

  final _index = 0.obs;
  int get index => _index.value;
  set index(int value) => _index.value = value;

  final addressEdit = TextEditingController();

  @override
  Future<void> onReady() async {
    final authUser = FirebaseAuth.instance.currentUser;
    if (authUser != null) {
      final user = await userRepository.getByAuthUid(authUser.uid);
      currentUser = user;
    }
  }

  @override
  void onClose() {
    addressEdit.dispose();
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    currentUser = null;
  }
}
