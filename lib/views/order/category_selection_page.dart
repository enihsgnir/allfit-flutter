import 'package:allfit_flutter/views/order/order_controller.dart';
import 'package:allfit_flutter/views/order/part_selection_page.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:allfit_flutter/widgets/custom_cached_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategorySelectionPage extends GetView<OrderController> {
  const CategorySelectionPage({super.key});

  static const route = "/order/category";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              children: const [
                SizedBox(width: 4),
                Text(
                  "원하는 수선 카테고리를\n선택해주세요",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 38),
            ...List.generate(
              controller.categoryListKo.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  leading: CustomCachedImage(
                    width: 24,
                    path: "icons/order_category/$index.png",
                  ),
                  title: Text(
                    controller.categoryListKo[index],
                    style: const TextStyle(fontSize: 15),
                  ),
                  trailing: const Icon(
                    CupertinoIcons.chevron_forward,
                    size: 24,
                    color: Colors.black,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onTap: () {
                    controller.categoryIndexCache = index;
                    Get.toNamed(PartSelectionPage.route);
                  },
                  tileColor: const Color.fromRGBO(245, 245, 245, 1),
                ),
              ),
            ),
            const SizedBox(height: 54),
            const Text(
              "수선 시 유의사항️",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              "선택한 카테고리에 따라 맞춤 핏 추천이 이루어지니 정확한 항목을 선택해주세요.",
              style: TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
