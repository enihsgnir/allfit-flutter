import 'package:allfit_flutter/domains/order/order.dart';
import 'package:allfit_flutter/utils/formats.dart';
import 'package:allfit_flutter/views/history/history_detail_page.dart';
import 'package:allfit_flutter/views/main_controller.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryListPage extends GetView<MainController> {
  const HistoryListPage({super.key});

  static const route = "/history";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "이용 내역"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Builder(
          builder: (context) {
            if (controller.histories.isEmpty) {
              return const Center(
                child: Text("이용 내역이 없습니다."),
              );
            }

            return ListView(
              children: controller.histories
                  .map((e) => HistoryListTile(order: e))
                  .toList(),
            );
          },
        ),
      ),
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
