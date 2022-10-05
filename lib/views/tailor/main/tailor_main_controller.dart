import 'package:allfit_flutter/domains/order/order.dart';
import 'package:allfit_flutter/domains/order/order_repository.dart';
import 'package:allfit_flutter/domains/tailor/tailor.dart';
import 'package:allfit_flutter/domains/tailor/tailor_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class TailorMainController extends GetxController {
  static TailorMainController get to => Get.find();

  final _currentTailor = Rxn<Tailor>();
  Tailor? get currentTailor => _currentTailor.value;
  set currentTailor(Tailor? value) => _currentTailor.value = value;

  final _ordersInProgress = <Order>[].obs;
  List<Order> get ordersInProgress => _ordersInProgress;
  set ordersInProgress(List<Order> value) => _ordersInProgress.value = value;

  final _ordersFinished = <Order>[].obs;
  List<Order> get ordersFinished => _ordersFinished;
  set ordersFinished(List<Order> value) => _ordersFinished.value = value;

  Worker? orderWorker;

  @override
  void onInit() {
    super.onInit();
    orderWorker = ever(_currentTailor, (_) async {
      final tailor = currentTailor;
      if (tailor == null) {
        return;
      }
      await getOrders(tailor.id);
    });
  }

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

  Future<void> getOrders(String tailorId) async {
    final orders = await orderRepository.getAllByTailorId(tailorId);
    ordersInProgress =
        orders.where((element) => element.paidAt == null).toList();
    ordersFinished = orders.where((element) => element.paidAt != null).toList();
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    currentTailor = null;
    ordersInProgress.clear();
    ordersFinished.clear();
  }
}
