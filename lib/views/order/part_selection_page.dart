import 'dart:io';

import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/views/order/order_controller.dart';
import 'package:allfit_flutter/views/order/value_selection_page.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:allfit_flutter/widgets/custom_cached_image.dart';
import 'package:allfit_flutter/widgets/custom_modal_bottom_sheet.dart';
import 'package:allfit_flutter/widgets/custom_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PartSelectionPage extends GetView<OrderController> {
  const PartSelectionPage({super.key});

  static const route = "/order/part";

  @override
  Widget build(BuildContext context) {
    final categoryIndex = controller.categoryIndexCache;

    return Scaffold(
      appBar: const CustomAppBar(),
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
                  controller.partListKo[categoryIndex].length,
                  (index) {
                    return InkWell(
                      onTap: () async {
                        controller.partIndexCache = index;
                        if (controller.itemImage == null) {
                          showImagePickActionSheet(context);
                        } else {
                          Get.toNamed(ValueSelectionPage.route);
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: lightGreyBackgroundColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomCachedImage(
                              width: 96,
                              height: 96,
                              path:
                                  "icons/order_category/${controller.categoryIndexCache}/$index.png",
                            ),
                            const SizedBox(height: 12),
                            Text(
                              controller.partListKo[categoryIndex][index],
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "상황에 따라 요청이 취소되거나 수선 품질 향상을 위해\n개별적인 확인 과정이 필요할 수도 있습니다.",
                  style: TextStyle(fontSize: 11),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const CustomBottomPadding(),
          ],
        ),
      ),
    );
  }

  Future<void> showImagePickActionSheet(BuildContext context) async {
    return showCustomModalBottomSheet(
      context: context,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            const Text(
              "수선 물품 이미지 선택",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Divider(),
            TextButton(
              onPressed: () async {
                final imagePicker = ImagePicker();
                final image = await imagePicker.pickImage(
                  source: ImageSource.camera,
                );

                if (image != null) {
                  controller.itemImage = File(image.path);
                  Get.toNamed(ValueSelectionPage.route);
                }
              },
              child: const Text("카메라"),
            ),
            const Divider(),
            TextButton(
              onPressed: () async {
                final imagePicker = ImagePicker();
                final photo = await imagePicker.pickImage(
                  source: ImageSource.gallery,
                );

                if (photo != null) {
                  controller.itemImage = File(photo.path);
                  Get.toNamed(ValueSelectionPage.route);
                }
              },
              child: const Text("갤러리"),
            ),
            const Divider(),
            TextButton(
              onPressed: () async {
                Get.toNamed(ValueSelectionPage.route);
              },
              child: const Text("skip_for_test"),
            ),
            const Divider(),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("취소"),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
