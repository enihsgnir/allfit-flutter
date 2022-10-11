import 'package:allfit_flutter/domains/order/order.dart';
import 'package:allfit_flutter/utils/formats.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:allfit_flutter/widgets/custom_key_value_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryDetailPage extends StatelessWidget {
  const HistoryDetailPage({super.key});

  static const route = "/history/detail";

  @override
  Widget build(BuildContext context) {
    final order = Get.arguments as Order;

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Text(
              formatDateTime(order.createdAt),
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 8),
            Text(
              order.status,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              order.substatus,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            const Text(
              "결제금액",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(color: Colors.black),
            CustomKeyValueList(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              interval: 12,
              keyStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              valueStyle: const TextStyle(fontSize: 12),
              data: {
                "안심 정찰 가격": formatCurrency(order.alterCost),
                "수거 & 배송": formatCurrency(order.deliveryFee),
                "총 결제 금액": formatCurrency(order.totalCost),
              },
            ),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }
}
