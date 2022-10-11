import 'package:allfit_flutter/domains/order/order.dart';
import 'package:allfit_flutter/domains/order/order_repository.dart';
import 'package:allfit_flutter/domains/user/user.dart';
import 'package:allfit_flutter/domains/user/user_repository.dart';
import 'package:allfit_flutter/utils/extensions.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:get/get.dart';

class MainController extends GetxController {
  static MainController get to => Get.find();

  final _currentUser = Rxn<User>();
  User? get currentUser => _currentUser.value;
  set currentUser(User? value) => _currentUser.value = value;

  final _index = 0.obs;
  int get index => _index.value;
  set index(int value) => _index.value = value;

  final _histories = <Order>[].obs;
  List<Order> get histories => _histories;
  set histories(List<Order> value) => _histories.value = value;

  Worker? _historyWorker;

  Order? get historyPreview => histories.firstOrNull;

  @override
  void onInit() {
    super.onInit();
    _historyWorker = ever(_currentUser, (_) async {
      final user = currentUser;
      if (user == null) {
        return;
      }
      histories = await orderRepository.getAllByUserId(user.id);
    });
  }

  @override
  Future<void> onReady() async {
    final authUser = FirebaseAuth.instance.currentUser;
    if (authUser != null) {
      final user = await userRepository.getByAuthUid(authUser.uid);
      if (user != null) {
        currentUser = user;
      } else {
        await signOut();
      }
    }
  }

  @override
  void onClose() {
    _historyWorker?.dispose();
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    currentUser = null;
    histories.clear();
  }
}
