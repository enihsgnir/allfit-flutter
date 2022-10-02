import 'package:allfit_flutter/domains/order/order.dart';
import 'package:allfit_flutter/utils/formats.dart';
import 'package:allfit_flutter/views/my_page/payment_history/payment_history_controller.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:allfit_flutter/widgets/unprepared_dialog.dart';
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
                HistoryList(ordersPaid: controller.ordersPaid),
                HistoryList(ordersPaid: controller.ordersPaid),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HistoryList extends StatelessWidget {
  final List<Order> ordersPaid;

  const HistoryList({
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
      return ListView.builder(
        itemCount: ordersPaid.length,
        itemBuilder: (context, index) => HistoryTile(
          order: ordersPaid[index],
        ),
      );
    });
  }
}

class HistoryTile extends StatelessWidget {
  final Order order;

  const HistoryTile({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showUnpreparedDialog(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                formatDateTime(order.createdAt),
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                order.serviceCategory,
                style: const TextStyle(fontSize: 10),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                order.totalCost.toString(),
                style: const TextStyle(fontSize: 10),
              ),
              const Icon(CupertinoIcons.chevron_forward)
            ],
          ),
        ],
      ),
    );
  }
}
