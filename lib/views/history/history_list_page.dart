import 'package:allfit_flutter/views/history/history_tab.dart';
import 'package:allfit_flutter/views/main_controller.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
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
            final user = controller.currentUser;
            if (user == null) {
              return const Center(
                child: Text("로그인 후 확인 가능합니다."),
              );
            }

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
