import 'package:allfit_flutter/domains/order/order.dart';
import 'package:allfit_flutter/utils/formats.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:allfit_flutter/widgets/custom_key_value_list.dart';
import 'package:allfit_flutter/widgets/custom_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentHistoryDetailPage extends StatelessWidget {
  const PaymentHistoryDetailPage({super.key});

  static const route = "/my_page/payment_history/detail";

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
            const CustomTopPadding(),
            const Text(
              "서비스 이용 결제 금액",
              style: TextStyle(fontSize: 10),
            ),
            const SizedBox(height: 8),
            Text(
              formatCurrency(order.totalCost),
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 56),
            CustomKeyValueList(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              interval: 20,
              keyStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              valueStyle: const TextStyle(fontSize: 12),
              data: {
                "결제일": formatDateTime(order.paidAt!),
                "이용 서비스": order.serviceCategory,
              },
            ),
            const SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "이용 항목",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "가격",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
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
                for (final point in order.allPoints)
                  point.part: formatCurrency(point.cost)
              },
            ),
            const SizedBox(height: 48),
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
                "결제 금액": formatCurrency(order.alterCost),
                "할인 금액": formatCurrency(order.discount),
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
