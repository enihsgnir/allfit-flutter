import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/utils/formats.dart';
import 'package:allfit_flutter/views/my_page/alter_service/alter_service_change_page.dart';
import 'package:allfit_flutter/views/my_page/alter_service/alter_service_controller.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:allfit_flutter/widgets/custom_key_value_list.dart';
import 'package:allfit_flutter/widgets/unprepared_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlterServicePage extends GetView<AlterServiceController> {
  const AlterServicePage({super.key});

  static const route = "/my_page/alter_service";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "이용 중인 서비스"),
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
            CustomKeyValueList(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              interval: 12,
              keyStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              valueStyle: const TextStyle(fontSize: 12),
              data: {
                "신청 서비스": controller.user.service.category,
                "신청일": formatDateTime(controller.user.service.createdAt),
                "이용 상태": controller.user.service.status,
                "수선요금": controller.user.service.cost,
              },
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
                    onPressed: () => showUnpreparedDialog(context),
                    child: const Text("해지"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 80),
            const Text(
              "신청 서비스",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(color: Colors.black),
            CustomKeyValueList(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              interval: 12,
              keyStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              valueStyle: const TextStyle(fontSize: 12),
              data: const {
                "배송지": "XXXX",
                "연락처": "XXX-XXXX-XXXX",
                "결제 정보": "XX은행",
                "공동현관 출입 방법": "공동현관 비밀번호",
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
