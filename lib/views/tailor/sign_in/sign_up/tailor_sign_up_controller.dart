import 'package:allfit_flutter/domains/tailor/tailor.dart';
import 'package:allfit_flutter/domains/tailor/tailor_repository.dart';
import 'package:allfit_flutter/domains/user/user.dart';
import 'package:allfit_flutter/views/tailor/main/tailor_main_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TailorSignUpController extends GetxController {
  static TailorSignUpController get to => Get.find();

  final emailEdit = TextEditingController();

  final _emailErrorMessage = "".obs;
  String get emailErrorMessage => _emailErrorMessage.value;
  set emailErrorMessage(String value) => _emailErrorMessage.value = value;

  bool get isEmailValueFailed => emailErrorMessage.isNotEmpty;

  final pwEdit = TextEditingController();

  final _obscureText = true.obs;
  bool get obscureText => _obscureText.value;
  set obscureText(bool value) => _obscureText.value = value;

  final _pwErrorMessage = "6자리 이상의 비밀번호를 사용하세요.".obs;
  String get pwErrorMessage => _pwErrorMessage.value;
  set pwErrorMessage(String value) => _pwErrorMessage.value = value;

  bool get isPwValueFailed => pwErrorMessage.isNotEmpty;

  final nameEdit = TextEditingController();
  final postCodeEdit = TextEditingController();
  final roadAddressEdit = TextEditingController();
  final detailAddressEdit = TextEditingController();
  final phoneEdit = TextEditingController();
  final bankAccountEdit = TextEditingController();

  final _category = <String>[].obs;
  List<String> get category => _category;
  set category(List<String> value) => _category.value = value;

  @override
  void onClose() {
    emailEdit.dispose();
    pwEdit.dispose();
    nameEdit.dispose();
    postCodeEdit.dispose();
    roadAddressEdit.dispose();
    detailAddressEdit.dispose();
    phoneEdit.dispose();
    bankAccountEdit.dispose();
  }

  Future<bool> signUp() async {
    emailErrorMessage = "";
    pwErrorMessage = "";

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailEdit.text.trim(),
        password: pwEdit.text,
      );

      final tailor = await tailorRepository.createOne(
        Tailor(
          id: "",
          authUid: credential.user!.uid,
          email: emailEdit.text.trim(),
          name: nameEdit.text.trim(),
          address: Address(
            postCode: postCodeEdit.text,
            roadAddress: roadAddressEdit.text,
            detailAddress: detailAddressEdit.text.trim(),
          ),
          phone: phoneEdit.text.trim(),
          bankAccount: bankAccountEdit.text.trim(),
          category: TailorCategory(
            first: category[0],
            second: category[1],
            third: category[2],
          ),
          createdAt: DateTime.now(),
        ),
      );
      TailorMainController.to.currentTailor = tailor;

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        emailErrorMessage = "이미 사용 중인 이메일입니다.";
      } else if (e.code == "invalid-email") {
        emailErrorMessage = "이메일 형식이 올바르지 않습니다.";
      } else if (e.code == "weak-password") {
        pwErrorMessage = "6자리 이상의 비밀번호를 사용하세요.";
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
