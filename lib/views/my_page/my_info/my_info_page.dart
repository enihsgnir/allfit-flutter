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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Text("로그인 정보"),
            const Divider(),
            Obx(() {
              if (controller.isEmailEditing) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("아이디 (이메일)"),
                    TextField(
                      controller: controller.emailEdit,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              controller.isEmailEditing = false;
                            },
                            child: const Text("변경 취소"),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              controller.isEmailEditing = false;
                            },
                            child: const Text("인증메일 발송"),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("아이디 (이메일)"),
                      Text("all.fit@gmail.com"),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.isEmailEditing = true;
                    },
                    child: const Text("변경"),
                  ),
                ],
              );
            }),
            const SizedBox(height: 32),
            Obx(() {
              if (controller.isPasswordEditing) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("비밀번호"),
                    TextField(
                      controller: controller.passwordEdit,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              controller.isPasswordEditing = false;
                            },
                            child: const Text("변경 취소"),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              controller.isPasswordEditing = false;
                            },
                            child: const Text("확인"),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("비밀번호"),
                      Text("* * * * * * * *"),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.isPasswordEditing = true;
                    },
                    child: const Text("변경"),
                  ),
                ],
              );
            }),
            const Divider(),
            const Text("회원 정보"),
            const Divider(),
            Obx(() {
              if (controller.isInfoEditing) {
                return Container();
              }
              return Container();
            }),
            const SizedBox(height: 40),
            InkWell(
              onTap: () async {
                await controller.withdraw();
                Get.back();
              },
              child: const Text(
                "회원탈퇴",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
