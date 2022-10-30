import 'package:allfit_flutter/domains/order/order.dart';
import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/utils/extensions.dart';
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
            const CustomTopPadding(addAppbarHeight: true),
            const Text(
              "입금 예정 금액",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  order.totalCost.toFormatted(printUnit: false),
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
            const SizedBox(height: 48),
            CustomKeyValueList(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              interval: 12,
              keyStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              valueStyle: const TextStyle(fontSize: 12),
              data: {
                "입금일": order.createdAt.toFormatted(isDotSeparated: true),
                "입금계좌": tailor?.bankAccount ?? "-",
              },
            ),
            const SizedBox(height: 24),
            const Divider(color: Colors.black),
            const SizedBox(height: 24),
            CustomKeyValueList(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              interval: 12,
              keyStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              valueStyle: const TextStyle(fontSize: 12),
              data: {
                "(A) 매출금액": order.totalCost.toFormatted(),
                "(B) 고객할인비용": 0.toFormatted(),
                "(C) 차감금액": (-order.deliveryFee).toFormatted(),
              },
            ),
            const SizedBox(height: 12),
            CustomKeyValueList(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              interval: 12,
              keyStyle: const TextStyle(
                color: greyTextColor,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
              valueStyle: const TextStyle(
                color: greyTextColor,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
              data: {
                "  ㄴ중개이용료": 0.toFormatted(),
                "  ㄴ배달비": (-order.deliveryFee).toFormatted(),
              },
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "(D) 부가세",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  0.toFormatted(),
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "입금예정금액 (A+B+C+D)",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  order.alterCost.toFormatted(),
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Builder(
              builder: (context) {
                final schedule = order.pickUpSchedule.toFormatted(
                  printWeekday: false,
                  printHourMinute: true,
                  printAmPm: true,
                );
                final components = schedule.split(" ");
                final date = components.sublist(0, 3);
                final time = components.sublist(3, components.length);

                return Column(
                  children: [
                    Text(
                      date.join(" "),
                      style: const TextStyle(fontSize: 16),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: time.join(" "),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(
                            text: "에 픽업합니다.",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 16),
            CustomElevatedButton(
              onPressed: Get.back,
              child: const Text(
                "확인",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const CustomBottomPadding(),
          ],
        ),
      ),
    );
  }
}
