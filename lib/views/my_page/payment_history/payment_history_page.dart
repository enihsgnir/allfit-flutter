import 'package:allfit_flutter/domains/order/order.dart';
import 'package:allfit_flutter/utils/formats.dart';
import 'package:allfit_flutter/views/my_page/payment_history/payment_history_controller.dart';
import 'package:allfit_flutter/views/my_page/payment_history/payment_history_detail_page.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentHistoryPage extends StatefulWidget {
  const PaymentHistoryPage({super.key});

  static const route = "/my_page/payment_history";

  @override
  State<PaymentHistoryPage> createState() => _PaymentHistoryPageState();
}

class _PaymentHistoryPageState extends State<PaymentHistoryPage>
    with TickerProviderStateMixin {
  final controller = PaymentHistoryController.to;

  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "결제내역"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            controller: tabController,
            isScrollable: true,
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            tabs: controller.criteria
                .map(
                  (e) => Tab(
                    child: Text(
                      e,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                PaymentHistoryList(
                  ordersPaid: controller.ordersPaidWithin30days,
                ),
                PaymentHistoryList(ordersPaid: controller.ordersPaid),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentHistoryList extends StatelessWidget {
  final List<Order> ordersPaid;

  const PaymentHistoryList({
    super.key,
    required this.ordersPaid,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (ordersPaid.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("결제내역이 없습니다."),
            ],
          ),
        );
      }
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView.builder(
          itemCount: ordersPaid.length,
          itemBuilder: (context, index) =>
              PaymentHistoryListTile(order: ordersPaid[index]),
        ),
      );
    });
  }
}

class PaymentHistoryListTile extends StatelessWidget {
  final Order order;

  const PaymentHistoryListTile({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        formatDateTime(order.createdAt),
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        order.serviceCategory,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 10,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            formatCurrency(order.totalCost),
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Icon(CupertinoIcons.chevron_forward),
        ],
      ),
      contentPadding: EdgeInsets.zero,
      onTap: () {
        Get.toNamed(PaymentHistoryDetailPage.route, arguments: order);
      },
    );
  }
}
