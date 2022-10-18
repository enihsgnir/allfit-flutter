import 'package:allfit_flutter/domains/order/order.dart';
import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/utils/formats.dart';
import 'package:allfit_flutter/views/tailor/main/tailor_main_controller.dart';
import 'package:allfit_flutter/widgets/custom_elevated_button.dart';
import 'package:allfit_flutter/widgets/custom_key_value_list.dart';
import 'package:allfit_flutter/widgets/custom_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TailorOrderSettlePage extends StatelessWidget {
  const TailorOrderSettlePage({super.key});

  static const route = "/tailor/order/settle";

  @override
  Widget build(BuildContext context) {
    final order = Get.arguments as Order;

    final tailor = TailorMainController.to.currentTailor;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 48),
            const Text(
              "입금 예정 금액",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "주문번호 ${order.id}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  formatCurrencyNoUnit(order.totalCost),
                  style: const TextStyle(
                    color: bluePointColor,
                    fontSize: 46,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "원",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 72),
            CustomKeyValueList(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              interval: 12,
              keyStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              valueStyle: const TextStyle(fontSize: 12),
              data: {
                "입금일": formatDateTimeDotted(order.createdAt),
                "입금계좌": tailor?.bankAccount ?? "-",
              },
            ),
            const SizedBox(height: 32),
            const Divider(color: Colors.black),
            const SizedBox(height: 32),
            CustomKeyValueList(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              interval: 12,
              keyStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              valueStyle: const TextStyle(fontSize: 12),
              data: {
                "(A) 매출금액": formatCurrency(order.totalCost),
                "(B) 고객할인비용": formatCurrency(0),
                "(C) 차감금액": formatCurrency(-order.deliveryFee),
                "  ㄴ중개이용료": formatCurrency(0),
                "  ㄴ배달비": formatCurrency(-order.deliveryFee),
                "(D) 부가세": formatCurrency(0),
                "입금예정금액 (A+B+C+D)": formatCurrency(order.alterCost),
              },
            ),
            const Spacer(),
            CustomElevatedButton(
              text: "확인",
              onPressed: Get.back,
            ),
            const CustomBottomPadding(),
          ],
        ),
      ),
    );
  }
}
