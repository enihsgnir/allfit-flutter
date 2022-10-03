import 'package:allfit_flutter/views/admin/admin_main_page.dart';
import 'package:allfit_flutter/views/main_controller.dart';
import 'package:allfit_flutter/views/tailor/main/tailor_main_page.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:allfit_flutter/widgets/custom_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends GetView<MainController> {
  const SettingsPage({super.key});

  static const route = "/my_page/settings";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "설정"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const Spacer(),
            const Text("준비 중입니다."),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () async {
                    await controller.signOut();
                    Get.offAllNamed(TailorMainPage.route);
                  },
                  child: const Text(
                    "Go_to_Tailor_Mode",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const VerticalDivider(),
                InkWell(
                  onTap: () async {
                    await controller.signOut();
                    Get.offAllNamed(AdminMainPage.route);
                  },
                  child: const Text(
                    "Go_to_Admin_Mode",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const CustomBottomPadding(),
          ],
        ),
      ),
    );
  }
}
