import 'package:allfit_flutter/views/my_page/my_info/my_info_controller.dart';
import 'package:allfit_flutter/widgets/default_app_bar.dart';
import 'package:allfit_flutter/widgets/unprepared_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyInfoPage extends GetView<MyInfoController> {
  const MyInfoPage({super.key});

  static const route = "/my_page/my_info";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const DefaultAppBar(title: "내 정보"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text(
                "로그인 정보",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(),
              const SizedBox(height: 20),
              Obx(() {
                if (controller.isEmailEditing) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "아이디 (이메일)",
                        style: TextStyle(fontSize: 12),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: controller.emailEdit,
                        decoration: const InputDecoration(
                          hintText: "이메일 주소를 입력해주세요",
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(fontSize: 12),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                controller.willEditEmail(willOpen: false);
                              },
                              child: const Text(
                                "변경 취소",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                controller.willEditEmail(willOpen: false);
                                showUnpreparedDialog(context);
                              },
                              child: const Text(
                                "인증메일 발송",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
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
                        Text(
                          "아이디 (이메일)",
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "allfit@gmail.com",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    OutlinedButton(
                      onPressed: () {
                        controller.willEditEmail(willOpen: true);
                      },
                      child: const Text(
                        "변경",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
              }),
              const SizedBox(height: 32),
              Obx(() {
                if (controller.isPwEditing) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "비밀번호",
                        style: TextStyle(fontSize: 12),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: controller.pwEdit,
                        decoration: const InputDecoration(
                          hintText: "비밀번호를 입력해주세요",
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(fontSize: 12),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                controller.willEditPassword(willOpen: false);
                              },
                              child: const Text(
                                "변경 취소",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                controller.willEditPassword(willOpen: false);
                                showUnpreparedDialog(context);
                              },
                              child: const Text(
                                "확인",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
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
                        Text(
                          "비밀번호",
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "* * * * * * * *",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    OutlinedButton(
                      onPressed: () {
                        controller.willEditPassword(willOpen: true);
                      },
                      child: const Text(
                        "변경",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
              }),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 36),
              const Text(
                "회원 정보",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
