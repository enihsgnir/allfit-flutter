import 'package:allfit_flutter/controllers/main_controller.dart';
import 'package:allfit_flutter/domains/user/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  Future<void> signIn() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailEdit.text,
        password: pwEdit.text,
      );

      final user = await userRepository.getByAuthUid(credential.user!.uid);
      MainController.to.currentUser = user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found for that email.");
      } else if (e.code == "wrong-password") {
        print("Wrong password provided for that user.");
      }
    }
  }
}
