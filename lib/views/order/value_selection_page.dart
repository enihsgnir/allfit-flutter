import 'package:allfit_flutter/domains/order/order.dart';
import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/views/order/order_controller.dart';
import 'package:allfit_flutter/views/order/part_selection_page.dart';
import 'package:allfit_flutter/views/order/point_selection_page.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:allfit_flutter/widgets/custom_cached_image.dart';
import 'package:allfit_flutter/widgets/custom_elevated_button.dart';
import 'package:allfit_flutter/widgets/custom_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ValueSelectionPage extends GetView<OrderController> {
  const ValueSelectionPage({super.key});

  static const route = "/order/value";

  @override
  Widget build(BuildContext context) {
    final point = Get.arguments as OrderPoint?;

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
          Column(
            children: [
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                color: lightGreyBackgroundColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomCachedImage(
                          width: 28,
                          height: 28,
                          path:
                              "icons/order_category/${controller.categoryIndexCache}/${controller.partIndexCache}.png",
                        ),
                        const SizedBox(width: 12),
                        Text(
                          controller.currentPartKo,
                          style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "선택한 수치만큼 수선이 이루어져요.",
                      style: TextStyle(fontSize: 13),
                    ),
                    const SizedBox(height: 60),
                    Obx(() {
                      if (controller.categoryIndexCache == 2 &&
                          controller.partIndexCache == 5) {
                        return Column(
                          children: const [
                            Text(
                              "업체와 컨택 후 내용 추가",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 28),
                          ],
                        );
                      }
                      return Slider(
                        value: controller.valueCache,
                        max: 20,
                        divisions: 40,
                        label: "${controller.valueCache}cm",
                        activeColor: Colors.black,
                        inactiveColor: lightGreyBackgroundColor,
                        thumbColor: Colors.white,
                        onChanged: (value) {
                          controller.valueCache = value;
                        },
                      );
                    }),
                    const SizedBox(height: 16),
                    CustomElevatedButton(
                      onPressed: () {
                        if (point == null) {
                          controller.addPoint();
                        } else {
                          controller.modifyPoint(point);
                        }
                        Get.offNamedUntil(
                          PointSelectionPage.route,
                          ModalRoute.withName(PartSelectionPage.route),
                        );
                      },
                      child: const Text(
                        "다음",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const CustomBottomPadding(),
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
