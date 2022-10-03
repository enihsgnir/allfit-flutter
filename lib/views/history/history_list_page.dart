import 'package:allfit_flutter/domains/order/order.dart';
import 'package:allfit_flutter/domains/order/order_repository.dart';
import 'package:allfit_flutter/utils/formats.dart';
import 'package:allfit_flutter/views/history/history_detail_page.dart';
import 'package:allfit_flutter/views/main_controller.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

class HistoryListPage extends GetView<MainController> {
  const HistoryListPage({super.key});

  static const route = "/history";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "이용 내역"),
      body: Builder(
        builder: (context) {
          final user = controller.currentUser;
          if (user == null) {
            return const Center(
              child: Text("로그인 후 확인 가능합니다."),
            );
          }

          return PaginateFirestore(
            query: orderRepository.paginatedByUserId(user.id),
            isLive: true,
            itemBuilderType: PaginateBuilderType.listView,
            itemBuilder: (context, documentSnapshots, index) {
              final order = documentSnapshots[index].data()! as Order;
              return ListTile(
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: Text(formatDateTime(order.createdAt)),
                subtitle: Text(order.id),
                onTap: () {
                  Get.toNamed(HistoryDetailPage.route, arguments: order);
                },
              );
            },
            onEmpty: const Text("이용 내역이 없습니다."),
          );
        },
      ),
    );
  }
}
