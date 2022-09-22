import 'package:allfit_flutter/domains/order/order.dart';
import 'package:allfit_flutter/domains/order/order_repository.dart';
import 'package:allfit_flutter/utils/formats.dart';
import 'package:allfit_flutter/views/main_controller.dart';
import 'package:get/get.dart';

class PaymentHistoryController extends GetxController {
  static PaymentHistoryController get to => Get.find();

  final criteria = ["30일", "90일"];

  final _ordersPaid = <Order>[].obs;
  List<Order> get ordersPaid => _ordersPaid;
  set ordersPaid(List<Order> value) => _ordersPaid.value = value;

  // List<Order> get ordersPaidWithin30days {
  //   return ordersPaid.where((element) {
  //     final today = DateTime.now().dateOnly();
  //     final paidAt = element.paidAt?.dateOnly();
  //     if (paidAt == null) {
  //       return false;
  //     }
  //     return paidAt.isAfter(today.subtract(const Duration(days: 30)));
  //   }).toList();
  // }

  @override
  Future<void> onReady() async {
    await getOrdersWithin(days: 90);
  }

  Future<void> getOrdersWithin({required int days}) async {
    final user = MainController.to.currentUser;
    if (user == null) {
      return;
    }

    ordersPaid = await orderRepository.getAllPaid(
      user.id,
      days: days,
    );
  }
}
