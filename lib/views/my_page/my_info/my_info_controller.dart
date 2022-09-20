import 'package:allfit_flutter/controllers/main_controller.dart';
import 'package:allfit_flutter/domains/user/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class MyInfoController extends GetxController {
  static MyInfoController get to => Get.find();

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
