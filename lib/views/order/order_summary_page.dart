import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/utils/extensions.dart';
import 'package:allfit_flutter/views/home/address/address_page.dart';
import 'package:allfit_flutter/views/main_controller.dart';
import 'package:allfit_flutter/views/main_page.dart';
import 'package:allfit_flutter/views/order/order_cancel_page.dart';
import 'package:allfit_flutter/views/order/order_controller.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:allfit_flutter/widgets/custom_elevated_button.dart';
import 'package:allfit_flutter/widgets/custom_key_value_list.dart';
import 'package:allfit_flutter/widgets/custom_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderSummaryPage extends GetView<OrderController> {
  const OrderSummaryPage({super.key});

  static const route = "/order/summary";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTopPadding(),
            const Text(
              "주문이 확정되면\n알려드릴게요",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            const Divider(color: lightBlackTextColor),
            const SizedBox(height: 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Builder(
                  builder: (context) {
                    final itemImage = controller.itemImage;
                    if (itemImage == null) {
                      return const Image(
                        width: 56,
                        height: 56,
                        fit: BoxFit.fitWidth,
                        image: AssetImage("assets/images/clothes_sample.png"),
                      );
                    }
                    return Image(
                      width: 56,
                      height: 56,
                      fit: BoxFit.fitWidth,
                      image: FileImage(itemImage),
                    );
                  },
                ),
                const SizedBox(width: 16),
                Column(
                  children: [
                    SizedBox(
                      height: 56,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${controller.currentCategoryKo} ${controller.pointsCache.length}개",
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                controller.totalCost.toFormatted(),
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                "입금확인중",
                                style: TextStyle(
                                  color: bluePointColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: controller.pointsCache
                          .map(
                            (e) => Text(
                              "\u2022 ${e.summary}",
                              style: const TextStyle(fontSize: 13),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 28),
            SizedBox(
              height: 48,
              child: OutlinedButton(
                onPressed: () {
                  Get.toNamed(OrderCancelPage.route);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.close, size: 16),
                    SizedBox(width: 4),
                    Text(
                      "주문 취소하기",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 56),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "수거지 정보",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(AddressPage.route);
                  },
                  child: const Text(
                    "변경하기",
                    style: TextStyle(
                      color: bluePointColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Obx(() {
              return CustomKeyValueList(
                mainAxisAlignment: MainAxisAlignment.start,
                keyWidth: 56,
                interval: 12,
                keyStyle: const TextStyle(
                  color: dartGreyTextColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
                valueStyle: const TextStyle(fontSize: 13),
                data: {
                  "주문자": MainController.to.currentUser?.nickname ?? "-",
                  "주소": MainController.to.currentUser?.mainAddress ?? "-",
                },
              );
            }),
            const Spacer(),
            CustomElevatedButton(
              onPressed: () async {
                await controller.createOrder();
                Get.until(ModalRoute.withName(MainPage.route));
              },
              child: const Text(
                "홈으로",
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
