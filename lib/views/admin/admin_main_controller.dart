import 'package:allfit_flutter/domains/admin/admin.dart';
import 'package:allfit_flutter/domains/admin/admin_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AdminMainController extends GetxController {
  static AdminMainController get to => Get.find();

  final _currentAdmin = Rxn<Admin>();
  Admin? get currentAdmin => _currentAdmin.value;
  set currentAdmin(Admin? value) => _currentAdmin.value = value;

  @override
  Future<void> onReady() async {
    final authUser = FirebaseAuth.instance.currentUser;
    if (authUser != null) {
      final admin = await adminRepository.getByAuthUid(authUser.uid);
      if (admin != null) {
        currentAdmin = admin;
      } else {
        await signOut();
      }
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    currentAdmin = null;
  }
}
