import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/utils/extensions.dart';
import 'package:allfit_flutter/views/main_page.dart';
import 'package:allfit_flutter/views/order/order_controller.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:allfit_flutter/widgets/custom_elevated_button.dart';
import 'package:allfit_flutter/widgets/custom_padding.dart';
import 'package:allfit_flutter/widgets/unprepared_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderCancelPage extends GetView<OrderController> {
  const OrderCancelPage({super.key});

  static const route = "/order/cancel";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "주문 취소"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTopPadding(),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.currentCategoryKo,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${controller.pointsCache.first.summary} 등 ${controller.pointsCache.length}개",
                      style: const TextStyle(
                        color: dartGreyTextColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      controller.totalCost.toFormatted(),
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 64),
            const Text(
              "취소 사유",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 40,
              child: OutlinedButton(
                onPressed: () => showUnpreparedDialog(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "사유를 선택해주세요.",
                      style: TextStyle(
                        color: dartGreyTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(
                      CupertinoIcons.chevron_down,
                      size: 20,
                      color: dartGreyTextColor,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              "상세 사유를 입력해주세요.",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(
                hintText: "사유을 입력해주세요.",
                contentPadding: EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 12,
                ),
              ),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              minLines: 4,
              maxLines: null,
            ),
            const SizedBox(height: 32),
            const Text(
              "취소/환불 정보",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "총 결제금액",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  controller.totalCost.toFormatted(),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "환불 방법",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "계좌이체",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const Spacer(),
            CustomElevatedButton(
              onPressed: () {
                Get.until(ModalRoute.withName(MainPage.route));
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
    );
  }
}
