import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/utils/extensions.dart';
import 'package:allfit_flutter/views/main_controller.dart';
import 'package:allfit_flutter/views/my_page/sign_in/sign_in_page.dart';
import 'package:allfit_flutter/views/order/deposit_info_page.dart';
import 'package:allfit_flutter/views/order/order_controller.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:allfit_flutter/widgets/custom_elevated_button.dart';
import 'package:allfit_flutter/widgets/custom_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailPage extends GetView<OrderController> {
  const OrderDetailPage({super.key});

  static const route = "/order/detail";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(title: "주문 상세"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Builder(
                      builder: (context) {
                        final itemImage = controller.itemImage;
                        if (itemImage == null) {
                          return const Image(
                            width: 56,
                            height: 56,
                            fit: BoxFit.fitWidth,
                            image:
                                AssetImage("assets/images/clothes_sample.png"),
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
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.currentCategoryKo,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "${controller.pointsCache.first.summary} 등 ${controller.pointsCache.length}개",
                          style: const TextStyle(
                            color: dartGreyTextColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  "${controller.totalCost.toFormatted()} ~",
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              "수선업체: ${controller.tailorName}",
              style: const TextStyle(
                color: greyTextColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "주소",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(controller.address),
            const SizedBox(height: 33),
            const Text(
              "수거일정",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(controller.pickUpSchedule.toFormatted()),
            const SizedBox(height: 33),
            const Text(
              "수선 요청사항",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(controller.extra),
            const SizedBox(height: 12),
            const Divider(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "총 수선금액",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  controller.alterCost.toFormatted(),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "배달팁",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  controller.deliveryFee.toFormatted(),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.black,
              height: 56,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "총 결제금액",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  controller.totalCost.toFormatted(),
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: controller.deliverySchedule.toFormatted(
                          printWeekday: false,
                        ),
                        style: const TextStyle(
                          color: bluePointColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(
                        text: " 완료 예상",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomElevatedButton(
              onPressed: () async {
                if (MainController.to.currentUser == null) {
                  Get.toNamed(SignInPage.route);
                } else {
                  Get.toNamed(DepositInfoPage.route);
                }
              },
              child: Text(
                "${controller.totalCost.toFormatted()} 결제하기",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
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
