import 'package:allfit_flutter/utils/formats.dart';
import 'package:allfit_flutter/views/history/history_list_page.dart';
import 'package:allfit_flutter/views/main_controller.dart';
import 'package:allfit_flutter/widgets/custom_key_value_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryTab extends GetView<MainController> {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final user = controller.currentUser;
      if (user == null) {
        return const Center(
          child: Text("로그인 후 확인 가능합니다."),
        );
      }

      return Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top),
                const SizedBox(height: 40),
                Text(
                  user.service.category,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 72),
                CustomKeyValueList(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  interval: 12,
                  keyStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  valueStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                  data: {
                    "신청 서비스": user.service.category,
                    "신청일": formatDateTime(user.service.createdAt),
                    "이용 상태": user.service.status,
                    "수선요금": user.service.cost,
                  },
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "최근 이용 내역",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(HistoryListPage.route);
                      },
                      child: const Text(
                        "더보기",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                const Divider(color: Colors.black),
                Obx(() {
                  final preview = controller.historyPreview;
                  if (preview == null) {
                    return Container(
                      alignment: Alignment.center,
                      height: 60,
                      child: const Text(
                        "이용내역이 없습니다.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }
                  return HistoryListTile(order: preview);
                }),
                const Divider(),
                const SizedBox(height: 40),
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
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      );
    });
  }
}
