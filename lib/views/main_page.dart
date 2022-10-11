import 'package:allfit_flutter/views/history/history_tab.dart';
import 'package:allfit_flutter/views/home/home_tab.dart';
import 'package:allfit_flutter/views/main_controller.dart';
import 'package:allfit_flutter/views/my_page/my_page_tab.dart';
import 'package:allfit_flutter/views/my_page/sign_in/sign_in_page.dart';
import 'package:allfit_flutter/views/order/order_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  static const route = "/main";

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: [
          const HomeTab(),
          const OrderTab(),
          const HistoryTab(),
          const MyPageTab(),
        ].elementAt(controller.index),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/home.png"),
                size: 28,
              ),
              label: "홈",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/order.png"),
                size: 28,
              ),
              label: "수선요청",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/history.png"),
                size: 28,
              ),
              label: "이용내역",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/my_page.png"),
                size: 28,
              ),
              label: "마이",
            ),
          ],
          onTap: (index) {
            if (index == 2 && controller.currentUser == null) {
              Get.toNamed(SignInPage.route);
            }
            controller.index = index;
          },
          currentIndex: controller.index,
          type: BottomNavigationBarType.fixed,
          iconSize: 28,
          selectedItemColor: const Color.fromRGBO(30, 30, 30, 1),
          unselectedItemColor: const Color.fromRGBO(207, 207, 207, 1),
          selectedLabelStyle: const TextStyle(fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontSize: 12),
        ),
      );
    });
  }
}
