import 'package:allfit_flutter/domains/order/order.dart';
import 'package:allfit_flutter/domains/order/order_repository.dart';
import 'package:allfit_flutter/utils/extensions.dart';
import 'package:allfit_flutter/views/main_controller.dart';
import 'package:get/get.dart';

class PaymentHistoryController extends GetxController {
  static PaymentHistoryController get to => Get.find();

  final criteria = ["30일 이내", "90일 이내"];

  final _ordersPaid = <Order>[].obs;
  List<Order> get ordersPaid => _ordersPaid;
  set ordersPaid(List<Order> value) => _ordersPaid.value = value;

  final _ordersPaidWithin30days = <Order>[].obs;
  List<Order> get ordersPaidWithin30days => _ordersPaidWithin30days;
  set ordersPaidWithin30days(List<Order> value) =>
      _ordersPaidWithin30days.value = value;

  @override
  Future<void> onReady() async {
    await getOrdersWithin();
  }

  Future<void> getOrdersWithin() async {
    final user = MainController.to.currentUser;
    if (user == null) {
      return;
    }

    final orders = await orderRepository.getAllPaid(
      user.id,
      days: 90,
    );
    ordersPaid = orders;
    ordersPaidWithin30days = orders.where((element) {
      final today = DateTime.now().dateOnly();
      final paidAt = element.paidAt?.dateOnly();
      if (paidAt == null) {
        return false;
      }
      return paidAt.isAfter(today.subtract(const Duration(days: 30)));
    }).toList();
  }
}
