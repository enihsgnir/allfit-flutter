import 'package:allfit_flutter/domains/order/order.dart';
import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/utils/formats.dart';
import 'package:allfit_flutter/views/main_page.dart';
import 'package:allfit_flutter/views/my_page/notice/notice_page.dart';
import 'package:allfit_flutter/views/tailor/main/detail/tailor_order_detail_page.dart';
import 'package:allfit_flutter/views/tailor/main/tailor_main_controller.dart';
import 'package:allfit_flutter/views/tailor/sign_in/tailor_sign_in_page.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:allfit_flutter/widgets/custom_cached_image.dart';
import 'package:allfit_flutter/widgets/custom_elevated_button.dart';
import 'package:allfit_flutter/widgets/custom_padding.dart';
import 'package:allfit_flutter/widgets/custom_toast.dart';
import 'package:allfit_flutter/widgets/unprepared_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TailorMainPage extends StatefulWidget {
  const TailorMainPage({super.key});

  static const route = "/tailor/main";

  @override
  State<TailorMainPage> createState() => _TailorMainPageState();
}

class _TailorMainPageState extends State<TailorMainPage>
    with TickerProviderStateMixin {
  final controller = TailorMainController.to;

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
      appBar: const CustomAppBar(
        title: "수선요청 현황",
        enableDrawer: true,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.black),
              child: Obx(() {
                final tailor = controller.currentTailor;
                if (tailor == null) {
                  return SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomTopPadding(),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(TailorSignInPage.route);
                          },
                          child: const Text(
                            "로그인 해주세요",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomTopPadding(),
                      Text(
                        tailor.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        tailor.address.toFormatted(),
                        style: const TextStyle(
                          color: greyPointColor,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
            ListTile(
              title: const Text(
                "공지사항",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: const Icon(CupertinoIcons.chevron_forward),
              onTap: () {
                Get.toNamed(NoticePage.route);
              },
            ),
            ListTile(
              title: const Text(
                "이용가이드",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: const Icon(CupertinoIcons.chevron_forward),
              onTap: () => showUnpreparedDialog(context),
            ),
            ListTile(
              title: const Text(
                "전문가광장",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: const Icon(CupertinoIcons.chevron_forward),
              onTap: () => showUnpreparedDialog(context),
            ),
            ListTile(
              title: const Text(
                "고객센터",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: const Icon(CupertinoIcons.chevron_forward),
              onTap: () => showUnpreparedDialog(context),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Obx(() {
                    final tailor = controller.currentTailor;
                    if (tailor == null) {
                      return const SizedBox.shrink();
                    }
                    return CustomElevatedButton(
                      text: "로그아웃",
                      onPressed: () async {
                        await controller.signOut();
                        showCustomToast("로그아웃 성공!");
                      },
                    );
                  }),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () async {
                          await controller.signOut();
                          Get.offAllNamed(MainPage.route);
                        },
                        child: const Text(
                          "Back_to_User_Mode",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const CustomBottomPadding(),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() {
            return TabBar(
              controller: tabController,
              isScrollable: true,
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              tabs: [
                "현재 처리 중 ${controller.ordersInProgress.length}",
                "완료 ${controller.ordersFinished.length}",
              ]
                  .map(
                    (e) => Tab(
                      child: Text(
                        e,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            );
          }),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                TailorOrderList(orders: controller.ordersInProgress),
                TailorOrderList(orders: controller.ordersFinished),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TailorOrderList extends GetView<TailorMainController> {
  final List<Order> orders;

  const TailorOrderList({
    super.key,
    required this.orders,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final tailor = controller.currentTailor;
      if (tailor == null) {
        return const Center(
          child: Text("로그인 후 확인 가능합니다."),
        );
      }

      if (orders.isEmpty) {
        return const Center(
          child: Text("이용 내역이 없습니다."),
        );
      }

      return ListView(
        children: orders.map((e) => TailorOrderListTile(order: e)).toList(),
      );
    });
  }
}

class TailorOrderListTile extends StatelessWidget {
  final Order order;

  const TailorOrderListTile({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    final imagePath = order.items.first.imagePath;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            formatDateTimeDottedWithHourAndMinute(order.createdAt),
            style: const TextStyle(fontSize: 10),
          ),
          ListTile(
            leading: CustomCachedImage(
              width: 64,
              height: double.infinity,
              fit: BoxFit.fitWidth,
              path: imagePath ?? "order_image/default.png",
            ),
            title: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.items.first.category,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  order.pointsSummary,
                  style: const TextStyle(fontSize: 11),
                ),
                const SizedBox(height: 4),
                Text(
                  order.address.roadAddress,
                  style: const TextStyle(
                    color: greyPointColor,
                    fontSize: 11,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
            trailing: const Icon(CupertinoIcons.chevron_forward),
            onTap: () {
              Get.toNamed(
                TailorOrderDetailPage.route,
                arguments: order,
              );
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
