import 'package:allfit_flutter/domains/order/order.dart';
import 'package:allfit_flutter/utils/formats.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:allfit_flutter/widgets/custom_key_value_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryDetailPage extends StatelessWidget {
  const HistoryDetailPage({super.key});

  static const route = "/history/detail";

  static final order = Get.arguments as Order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Text(formatDateTime(order.createdAt)),
            ...() {
              const style1 = TextStyle();
              const style2 = TextStyle();

              String text1 = "";
              String text2 = "";

              final now = DateTime.now();
              final receivedAt = order.receivedAt;
              if (receivedAt == null) {
                text1 = "배송 중";
                text2 = "내일 배송 예정";
              } else {
                text1 = "수선 아이템 수령 완료";
                text2 = "수선물을 확인해주세요.";
              }

              return [
                Text(
                  text1,
                  style: style1,
                ),
                Text(
                  text2,
                  style: style2,
                ),
              ];
            }(),
            CustomKeyValueList(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              interval: 12,
              data: {
                "안심 정찰 가격": order.alterCost.toString(),
                "수거 & 배송": order.deliveryFee.toString(),
                "총 결제 금액": order.totalCost.toString(),
              },
            ),
          ],
        ),
      ),
    );
  }
}
