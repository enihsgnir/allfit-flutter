import 'package:allfit_flutter/domains/order/order.dart';
import 'package:allfit_flutter/domains/order/order_repository.dart';
import 'package:allfit_flutter/domains/user/user.dart';
import 'package:allfit_flutter/domains/user/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
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

  final _historyPreview = <Order>[].obs;
  List<Order> get historyPreview => _historyPreview;
  set historyPreview(List<Order> value) => _historyPreview.value = value;

  @override
  Future<void> onReady() async {
    final authUser = FirebaseAuth.instance.currentUser;
    if (authUser != null) {
      final user = await userRepository.getByAuthUid(authUser.uid);
      if (user != null) {
        currentUser = user;
        await getHistoryPreview(user);
      } else {
        await signOut();
      }
    }
  }

  Future<void> getHistoryPreview(User user) async {
    historyPreview = await orderRepository.getAllByUserId(
      user.id,
      limit: 1,
    );
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    currentUser = null;
  }
}
