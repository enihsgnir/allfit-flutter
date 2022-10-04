import 'package:allfit_flutter/domains/user/user_repository.dart';
import 'package:allfit_flutter/views/main_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  static SignInController get to => Get.find();

  final emailEdit = TextEditingController();

  final _emailErrorMessage = "".obs;
  String get emailErrorMessage => _emailErrorMessage.value;
  set emailErrorMessage(String value) => _emailErrorMessage.value = value;

  bool get isEmailValueFailed => emailErrorMessage.isNotEmpty;

  final pwEdit = TextEditingController();

  final _pwErrorMessage = "".obs;
  String get pwErrorMessage => _pwErrorMessage.value;
  set pwErrorMessage(String value) => _pwErrorMessage.value = value;

  bool get isPwValueFailed => pwErrorMessage.isNotEmpty;

  @override
  void onClose() {
    emailEdit.dispose();
    pwEdit.dispose();
  }

  Future<bool> signIn() async {
    emailErrorMessage = "";
    pwErrorMessage = "";

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailEdit.text,
        password: pwEdit.text,
      );

      final user = await userRepository.getByAuthUid(credential.user!.uid);
      if (user == null) {
        emailErrorMessage = "사장님/관리자는 별도의 앱을 이용해주시기 바랍니다.";
        return false;
      }

      MainController.to.currentUser = user;
      MainController.to.getHistoryPreview(user);

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email" ||
          e.code == "user-disabled" ||
          e.code == "user-not-found") {
        emailErrorMessage = "이메일이 올바르지 않습니다.";
      } else if (e.code == "wrong-password") {
        pwErrorMessage = "비밀번호가 올바르지 않습니다.";
      } else if (e.code == "too-many-requests") {
        pwErrorMessage = "잠시 후 다시 시도해주세요.";
      } else if (e.message == "Given String is empty or null") {
        if (emailEdit.text.isEmpty) {
          emailErrorMessage = "이메일을 입력해주세요.";
        } else {
          pwErrorMessage = "비밀번호를 입력해주세요.";
        }
      } else {
        rethrow;
      }
      return false;
    }
  }
}
