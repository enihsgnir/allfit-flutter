import 'package:allfit_flutter/views/order/point_selection_page.dart';
import 'package:allfit_flutter/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartSelectionPage extends StatelessWidget {
  const PartSelectionPage({super.key});

  static const route = "/order/part";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 19),
            Row(
              children: const [
                SizedBox(width: 24),
                Text(
                  "구체적인 수선 희망 부위를\n선택해주세요",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 17),
            Container(
              width: 315,
              height: 528,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 9,
                  crossAxisSpacing: 9,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(PointSelectionPage.route);
                    },
                    child: Container(
                      width: 153,
                      height: 170,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
