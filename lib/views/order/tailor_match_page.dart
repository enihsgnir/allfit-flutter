import 'dart:math';

import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/views/main_controller.dart';
import 'package:allfit_flutter/views/order/order_controller.dart';
import 'package:allfit_flutter/views/order/order_detail_page.dart';
import 'package:allfit_flutter/views/order/point_selection_page.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:allfit_flutter/widgets/custom_cached_image.dart';
import 'package:allfit_flutter/widgets/custom_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TailorMatchPage extends GetView<OrderController> {
  const TailorMatchPage({super.key});

  static const route = "/order/match";

  @override
  Widget build(BuildContext context) {
    final user = MainController.to.currentUser;

    final tailors = controller.tailors;
    final tailor = tailors.elementAt(Random().nextInt(tailors.length));

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(height: 8),
                  const Text(
                    "매칭된 수선업체",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      const CustomCachedImage(
                        width: 56,
                        path: "circle_avatar/tailor/default.png",
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tailor.name,
                            style: const TextStyle(
                              color: bluePointColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            tailor.description ?? tailor.name,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(),
                  ...controller.pointsCache
                      .map(
                        (e) => OrderPointListTile(
                          categoryEng: "t_shirt",
                          point: e,
                          atDecision: true,
                        ),
                      )
                      .toList(),
                  const SizedBox(height: 24),
                  const Text(
                    "수선 요청사항",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "수선 사장님께",
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: controller.extraEdit,
                  ),
                  const SizedBox(height: 32),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "수선할 의류",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: " 총 ${controller.pointsCache.length}개",
                          style: const TextStyle(
                            color: greyPointColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      const warning = "로그인 후 이용가능합니다.";

                      final now = DateTime.now();
                      controller.tailorId = tailor.id;
                      controller.tailorName = tailor.name;
                      controller.address = user?.mainAddress ?? warning;
                      controller.pickUpSchedule =
                          now.add(const Duration(days: 3));
                      controller.deliverySchedule =
                          now.add(const Duration(days: 7));

                      Get.toNamed(OrderDetailPage.route);
                    },
                    child: const Text(
                      "주문하기",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const CustomBottomPadding(),
          ],
        ),
      ),
    );
  }
}
