import 'package:allfit_flutter/domains/order/order.dart';
import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/utils/extensions.dart';
import 'package:allfit_flutter/views/tailor/main/detail/tailor_order_detail_controller.dart';
import 'package:allfit_flutter/views/tailor/main/detail/tailor_order_settle_page.dart';
import 'package:allfit_flutter/views/tailor/main/tailor_main_page.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:allfit_flutter/widgets/custom_cached_image.dart';
import 'package:allfit_flutter/widgets/custom_elevated_button.dart';
import 'package:allfit_flutter/widgets/custom_key_value_list.dart';
import 'package:allfit_flutter/widgets/custom_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TailorOrderDetailPage extends GetView<TailorOrderDetailController> {
  const TailorOrderDetailPage({super.key});

  static const route = "/tailor/order/detail";

  @override
  Widget build(BuildContext context) {
    final order = Get.arguments as Order;

    return Scaffold(
      appBar: const CustomAppBar(title: "수선의류 상세"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  CustomCachedImage(
                    height: 400,
                    fit: BoxFit.fitHeight,
                    path: "order_image/${order.id}.png",
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "수선 요청사항",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomKeyValueList(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    interval: 4,
                    keyStyle: const TextStyle(fontSize: 16),
                    valueStyle: const TextStyle(fontSize: 14),
                    data: {
                      for (final point in order.allPoints)
                        point.summary: "${point.cost.toFormatted()} ~"
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "추가 요청사항",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.check, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          order.extra ?? "없음",
                          style: const TextStyle(fontSize: 16),
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CustomElevatedButton(
              backgroundColor: bluePointColor,
              isActiveIf: order.finishedAt == null,
              onPressed: () {
                showOrderFinishBottomSheet(context, order: order);
              },
              child: const Text(
                "수선 완료",
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

  Future<void> showOrderFinishBottomSheet(
    BuildContext context, {
    required Order order,
  }) async {
    return showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 28),
                  const Text(
                    "고객에게 전달할 내용을\n입력해주세요",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: "예) 밑단 포인트 살려주세요",
                      filled: true,
                      fillColor: lightGreyBackgroundColor,
                    ),
                    style: TextStyle(fontSize: 14),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 60),
                  const Text(
                    "추가금액 요청",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Obx(() {
                        return Radio<bool>(
                          value: true,
                          groupValue: controller.surchargeExists,
                          onChanged: (value) {
                            controller.surchargeExists =
                                !controller.surchargeExists;
                          },
                          activeColor: Colors.black,
                        );
                      }),
                      const Text(
                        "예",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        child: SizedBox(
                          height: 28,
                          child: Obx(() {
                            return TextField(
                              enabled: controller.surchargeExists,
                              controller: controller.surchargeEdit,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: lightGreyBackgroundColor,
                              ),
                              style: const TextStyle(fontSize: 16),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(r"^[1-9][0-9]*$"),
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "원",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Obx(() {
                        return Radio<bool>(
                          value: false,
                          groupValue: controller.surchargeExists,
                          onChanged: (value) {
                            controller.surchargeExists =
                                !controller.surchargeExists;
                          },
                          activeColor: Colors.black,
                        );
                      }),
                      const Text(
                        "아니오",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 120),
                  CustomElevatedButton(
                    backgroundColor: bluePointColor,
                    onPressed: () async {
                      await controller.finishOrder(order.id);
                      Get.offNamedUntil(
                        TailorOrderSettlePage.route,
                        ModalRoute.withName(TailorMainPage.route),
                        arguments: order,
                      );
                    },
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
          ],
        );
      },
    );
  }
}
