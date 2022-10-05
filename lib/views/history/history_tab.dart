import 'package:allfit_flutter/domains/order/order.dart';
import 'package:allfit_flutter/utils/formats.dart';
import 'package:allfit_flutter/views/history/history_detail_page.dart';
import 'package:allfit_flutter/views/history/history_list_page.dart';
import 'package:allfit_flutter/views/main_controller.dart';
import 'package:allfit_flutter/widgets/custom_key_value_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryTab extends GetView<MainController> {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          color: Colors.black,
          child: Obx(() {
            const warning = "로그인 후 확인 가능합니다.";
            final user = controller.currentUser;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top),
                const SizedBox(height: 40),
                Text(
                  user == null ? warning : user.service.category,
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
                    "신청 서비스": user == null ? warning : user.service.category,
                    "신청일": user == null
                        ? warning
                        : formatDateTime(user.service.createdAt),
                    "이용 상태": user == null ? warning : user.service.status,
                    "수선요금": user == null ? warning : user.service.cost,
                  },
                ),
                const SizedBox(height: 32),
              ],
            );
          }),
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
                    "이용 내역",
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
  }
}

class HistoryListTile extends StatelessWidget {
  final Order order;

  const HistoryListTile({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        formatDateTime(order.createdAt),
        style: const TextStyle(fontSize: 13),
      ),
      subtitle: Text(
        order.status,
        style: const TextStyle(
          color: Color.fromRGBO(60, 132, 240, 1),
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: const Icon(CupertinoIcons.chevron_forward),
      contentPadding: EdgeInsets.zero,
      onTap: () {
        Get.toNamed(HistoryDetailPage.route, arguments: order);
      },
    );
  }
}
