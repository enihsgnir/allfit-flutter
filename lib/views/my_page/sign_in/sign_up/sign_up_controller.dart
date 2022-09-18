import 'package:allfit_flutter/domains/user/user.dart';
import 'package:allfit_flutter/domains/user/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get to => Get.find();

  final _terms = false.obs;
  bool get terms => _terms.value;
  set terms(bool value) => _terms.value = value;

  final _privacy = false.obs;
  bool get privacy => _privacy.value;
  set privacy(bool value) => _privacy.value = value;

  final _notification = false.obs;
  bool get notification => _notification.value;
  set notification(bool value) => _notification.value = value;

  final _commercial = false.obs;
  bool get commercial => _commercial.value;
  set commercial(bool value) => _commercial.value = value;

  bool get canMoveOn => terms && privacy && notification;

  bool get isAllChecked => canMoveOn && commercial;

  final emailEdit = TextEditingController();
  final pwEdit = TextEditingController();

  final _obscureText = true.obs;
  bool get obscureText => _obscureText.value;
  set obscureText(bool value) => _obscureText.value = value;

  @override
  void onClose() {
    emailEdit.dispose();
    pwEdit.dispose();
  }

  Future<void> signUp() async {
    final now = DateTime.now();

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailEdit.text.trim(),
        password: pwEdit.text,
      );

      await userRepository.createOne(
        User(
          id: "",
          authUid: credential.user!.uid,
          email: emailEdit.text.trim(),
          wayToEnter: "",
          service: AlterService(
            category: "1회 이용수선서비스",
            createdAt: now,
            status: "이용 중",
          ),
          commercialAgreement: commercial,
          createdAt: now,
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        print("The password provided is too weak.");
      } else if (e.code == "email-already-in-use") {
        print("The account already exists for that email.");
      }
    } catch (e) {
      print(e);
    }
  }
}
