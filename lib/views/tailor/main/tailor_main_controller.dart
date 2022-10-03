import 'package:allfit_flutter/domains/tailor/tailor.dart';
import 'package:allfit_flutter/domains/tailor/tailor_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class TailorMainController extends GetxController {
  static TailorMainController get to => Get.find();

  final _currentTailor = Rxn<Tailor>();
  Tailor? get currentTailor => _currentTailor.value;
  set currentTailor(Tailor? value) => _currentTailor.value = value;

  // final _inProgressLength = 0.obs;
  // int get inProgressLength => _inProgressLength.value;
  // set inProgressLength(int value) => _inProgressLength.value = value;

  // String get inProgressTabText => "현재 처리 중 $inProgressLength";

  // final _finishedLength = 0.obs;
  // int get finishedLength => _finishedLength.value;
  // set finishedLength(int value) => _finishedLength.value = value;

  // String get finishedTabText => "완료 $finishedLength";

  @override
  Future<void> onReady() async {
    final authUser = FirebaseAuth.instance.currentUser;
    if (authUser != null) {
      final tailor = await tailorRepository.getByAuthUid(authUser.uid);
      if (tailor != null) {
        currentTailor = tailor;
      } else {
        await signOut();
      }
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    currentTailor = null;
  }
}
