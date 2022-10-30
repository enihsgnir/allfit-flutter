import 'package:allfit_flutter/domains/user/user.dart';
import 'package:allfit_flutter/domains/user/user_repository.dart';
import 'package:allfit_flutter/views/main_controller.dart';
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

  final nicknameEdit = TextEditingController();
  final phoneEdit = TextEditingController();
  final postCodeEdit = TextEditingController();
  final roadAddressEdit = TextEditingController();
  final detailAddressEdit = TextEditingController();

  @override
  void onClose() {
    emailEdit.dispose();
    pwEdit.dispose();
    nicknameEdit.dispose();
    phoneEdit.dispose();
    postCodeEdit.dispose();
    roadAddressEdit.dispose();
    detailAddressEdit.dispose();
  }

  Future<bool> signUp() async {
    emailErrorMessage = "";
    pwErrorMessage = "";

    final now = DateTime.now();

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailEdit.text.trim(),
        password: pwEdit.text,
      );

      final user = await userRepository.createOne(
        User(
          id: "",
          authUid: credential.user!.uid,
          email: emailEdit.text.trim(),
          nickname: nicknameEdit.text.trim(),
          phone: phoneEdit.text.isEmpty
              ? null
              : phoneEdit.text.replaceAll("-", ""),
          addresses: [
            Address(
              postCode: postCodeEdit.text,
              roadAddress: roadAddressEdit.text,
              detailAddress: detailAddressEdit.text.trim(),
            ),
          ],
          mainAddressIndex: 0,
          wayToEnter: "",
          service: AlterService(
            category: "1회 이용수선서비스",
            createdAt: now,
            status: "이용 중",
            cost: "안심 정찰 가격표에 의해 요금 부과",
          ),
          commercialAgreement: commercial,
          createdAt: now,
        ),
      );
      MainController.to.currentUser = user;

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
