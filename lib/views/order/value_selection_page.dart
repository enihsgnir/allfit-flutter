import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/views/order/order_controller.dart';
import 'package:allfit_flutter/views/order/part_selection_page.dart';
import 'package:allfit_flutter/views/order/point_selection_page.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ValueSelectionPage extends GetView<OrderController> {
  const ValueSelectionPage({super.key});

  static const route = "/order/value";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),
      body: Stack(
        children: [
          const Image(
            fit: BoxFit.fitWidth,
            image: AssetImage("assets/images/clothes_sample.png"),
          ),
          Column(
            children: [
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                color: backgroundColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      controller.getCurrentPartKo(),
                      style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "선택한 수치만큼 수선이 이루어져요.",
                      style: TextStyle(fontSize: 13),
                    ),
                    const SizedBox(height: 60),
                    Obx(() {
                      return Slider(
                        value: controller.valueCache,
                        max: 20,
                        divisions: 40,
                        label: "${controller.valueCache}cm",
                        activeColor: Colors.black,
                        onChanged: (value) {
                          controller.valueCache = value;
                        },
                      );
                    }),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              controller.addPoint();
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
