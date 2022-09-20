import 'package:allfit_flutter/views/my_page/my_info/my_info_controller.dart';
import 'package:allfit_flutter/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyInfoPage extends GetView<MyInfoController> {
  const MyInfoPage({super.key});

  static const route = "/my_page/my_info";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: "내 정보"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("준비 중입니다."),
            TextButton(
              onPressed: () async {
                await controller.withdraw();
                Get.back();
              },
              child: const Text("회원탈퇴"),
            ),
          ],
        ),
      ),
    );
  }
}
