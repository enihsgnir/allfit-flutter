import 'dart:math';

import 'package:allfit_flutter/domains/tailor/tailor_repository.dart';
import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/views/main_controller.dart';
import 'package:allfit_flutter/views/order/order_controller.dart';
import 'package:allfit_flutter/views/order/order_detail_page.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:allfit_flutter/widgets/custom_cached_image.dart';
import 'package:allfit_flutter/widgets/unprepared_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PointSelectionPage extends GetView<OrderController> {
  const PointSelectionPage({super.key});

  static const route = "/order/point";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          const Image(
            image: AssetImage("assets/images/clothes_sample.png"),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    controller.category,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    leading: SizedBox(
                      height: double.infinity,
                      child: CustomCachedImage(
                        width: 28,
                        path: "icons/category/${controller.iconAssetName}.png",
                      ),
                    ),
                    title: Text(
                      controller.part,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      "${controller.pointValue}cm",
                      style: const TextStyle(fontSize: 12),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () => showUnpreparedDialog(context),
                          child: const Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              "수정",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => showUnpreparedDialog(context),
                          child: const Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              "삭제",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => showUnpreparedDialog(context),
                    child: Row(
                      children: const [
                        Text(
                          "+",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 16),
                        Text(
                          "수선 희망 부위 추가",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "예상 가격",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "12,000원~",
                        style: TextStyle(
                          color: bluePointColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            await bottomSheet(context);
                          },
                          child: const Text(
                            "다음",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> bottomSheet(BuildContext context) async {
    final user = MainController.to.currentUser;

    final tailors = await tailorRepository.getAll();
    final tailor = tailors.elementAt(Random().nextInt(tailors.length));

    return showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 28),
              Row(
                children: const [
                  Text(
                    "매칭된 수선업체",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
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
              const Spacer(),
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
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
