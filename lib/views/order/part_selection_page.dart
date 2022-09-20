import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/views/order/order_controller.dart';
import 'package:allfit_flutter/views/order/point_selection_page.dart';
import 'package:allfit_flutter/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartSelectionPage extends GetView<OrderController> {
  const PartSelectionPage({super.key});

  static const route = "/order/part";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "구체적인 수선 희망 부위를\n선택해주세요",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 18),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 9,
                crossAxisSpacing: 9,
                children: List.generate(
                  controller.parts[controller.categoryIndex].length,
                  (index) {
                    final part =
                        controller.parts[controller.categoryIndex][index];
                    return InkWell(
                      onTap: () {
                        controller.partIndex = index;
                        Get.toNamed(PointSelectionPage.route);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        color: backgroundColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              width: 96,
                              image: AssetImage(
                                "assets/images/${controller.iconAssetName}_${controller.partListEng[controller.categoryIndex][index]}.png",
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(part),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
