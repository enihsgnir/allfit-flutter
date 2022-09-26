import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/utils/formats.dart';
import 'package:allfit_flutter/views/my_page/alter_service/alter_service_change_page.dart';
import 'package:allfit_flutter/views/my_page/alter_service/alter_service_controller.dart';
import 'package:allfit_flutter/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlterServicePage extends GetView<AlterServiceController> {
  const AlterServicePage({super.key});

  static const route = "/my_page/alter_service";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: "이용 중인 서비스"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            Row(
              children: [
                Text(
                  controller.user.service.category,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  controller.user.service.status,
                  style: const TextStyle(
                    color: bluePointColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              "안심 정찰 가격표에 의해 요금이 부과됩니다.",
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 28),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "신청 서비스",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      controller.user.service.category,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "신청일",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      formatDateTime(controller.user.service.createdAt),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "이용 상태",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      controller.user.service.status,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "수선요금",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "안심 정찰 가격표에 의해 요금 부과",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(AlterServiceChangePage.route);
                    },
                    child: const Text("변경"),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("해지"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 80),
            const Text("신청 서비스"),
            const Divider(color: Colors.black),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
