import 'package:allfit_flutter/domains/order/order.dart';
import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/utils/formats.dart';
import 'package:allfit_flutter/views/order/order_controller.dart';
import 'package:allfit_flutter/views/order/part_selection_page.dart';
import 'package:allfit_flutter/views/order/tailor_match_page.dart';
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
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),
      body: Stack(
        children: [
          Builder(
            builder: (context) {
              final itemImage = controller.itemImage;
              if (itemImage == null) {
                return const Image(
                  fit: BoxFit.fitWidth,
                  image: AssetImage("assets/images/clothes_sample.png"),
                );
              }
              return Image(
                fit: BoxFit.fitWidth,
                image: FileImage(itemImage),
              );
            },
          ),
          ListView(
            reverse: true,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                color: lightGreyBackgroundColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      controller.currentCategoryKo,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Obx(() {
                      if (controller.pointsCache.isEmpty) {
                        return const SizedBox(height: 64);
                      }
                      return Column(
                        children: controller.pointsCache
                            .map(
                              (e) => OrderPointListTile(
                                point: e,
                                atDecision: false,
                              ),
                            )
                            .toList(),
                      );
                    }),
                    InkWell(
                      onTap: () {
                        Get.until(ModalRoute.withName(PartSelectionPage.route));
                      },
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
                      children: [
                        const Text(
                          "예상 가격",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Obx(() {
                          return Text(
                            "${formatCurrency(controller.alterCost)} ~",
                            style: const TextStyle(
                              color: bluePointColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        }),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed(TailorMatchPage.route);
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
            ],
          ),
        ],
      ),
    );
  }
}

class OrderPointListTile extends GetView<OrderController> {
  final OrderPoint point;
  final bool atDecision;

  const OrderPointListTile({
    super.key,
    required this.point,
    required this.atDecision,
  });

  @override
  Widget build(BuildContext context) {
    final categoryIndex = controller.categoryIndexCache;
    final partIndex = controller.partListKo[categoryIndex].indexOf(point.part);

    return ListTile(
      leading: SizedBox(
        height: double.infinity,
        child: CustomCachedImage(
          width: 28,
          path: "icons/order_category/$categoryIndex/$partIndex.png",
        ),
      ),
      title: Text(
        point.part,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        "${point.value}cm",
        style: const TextStyle(fontSize: 12),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (atDecision)
            Text(
              "${formatCurrency(point.cost)} ~",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            )
          else ...[
            SizedBox(
              width: 40,
              child: TextButton(
                onPressed: () => showUnpreparedDialog(context),
                child: const Text(
                  "수정",
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
            SizedBox(
              width: 40,
              child: TextButton(
                onPressed: () {
                  controller.removePoint(point);
                },
                child: const Text(
                  "삭제",
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
