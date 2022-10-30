import 'package:allfit_flutter/views/admin/admin_main_controller.dart';
import 'package:allfit_flutter/views/main_page.dart';
import 'package:allfit_flutter/widgets/custom_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminMainPage extends GetView<AdminMainController> {
  const AdminMainPage({super.key});

  static const route = "/admin/main";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const CustomTopPadding(addAppbarHeight: true),
            const Spacer(),
            ElevatedButton(
              onPressed: () async {},
              child: const Text("dev"),
            ),
            const Spacer(),
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
            const CustomBottomPadding(),
          ],
        ),
      ),
    );
  }
}
