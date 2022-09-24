import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/views/my_page/sign_in/sign_up/account_detail_page.dart';
import 'package:allfit_flutter/views/my_page/sign_in/sign_up/sign_up_controller.dart';
import 'package:allfit_flutter/widgets/default_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});

  static const route = "/sign_up";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const DefaultAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 36),
              const LinearProgressIndicator(
                value: 2 / 4,
                backgroundColor: backgroundColor,
                color: semiBlackPointColor,
                minHeight: 4,
              ),
              const SizedBox(height: 24),
              const Text(
                "얼핏 회원가입을 위해\n아이디와 비밀번호를 입력해주세요.",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 36),
              TextFormField(
                controller: controller.emailEdit,
                decoration: const InputDecoration(
                  hintText: "이메일 주소 입력",
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                ),
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(fontSize: 12),
              ),
              Obx(() {
                if (!controller.isEmailValueFailed) {
                  return const SizedBox.shrink();
                }
                return Text(
                  controller.emailErrorMessage,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 11,
                  ),
                );
              }),
              const SizedBox(height: 24),
              Obx(() {
                return TextFormField(
                  controller: controller.pwEdit,
                  decoration: InputDecoration(
                    hintText: "비밀번호",
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    suffixIcon: IconButton(
                      splashRadius: 20,
                      onPressed: () {
                        controller.obscureText = !controller.obscureText;
                      },
                      icon: Icon(
                        controller.obscureText
                            ? CupertinoIcons.eye
                            : CupertinoIcons.eye_slash,
                        color: semiBlackPointColor,
                      ),
                    ),
                  ),
                  style: const TextStyle(fontSize: 12),
                  obscureText: controller.obscureText,
                );
              }),
              Obx(() {
                if (!controller.isPwValueFailed) {
                  return const SizedBox.shrink();
                }
                return Text(
                  controller.pwErrorMessage,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 11,
                  ),
                );
              }),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 44,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(AccountDetailPage.route);
                        },
                        child: const Text(
                          "다음",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
