import 'package:allfit_flutter/domains/user/user.dart';
import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/views/my_page/inquiry/inquiry_writing_controller.dart';
import 'package:allfit_flutter/widgets/default_app_bar.dart';
import 'package:allfit_flutter/widgets/expanded_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InquiryWritingPage extends GetView<InquiryWritingController> {
  const InquiryWritingPage({super.key});

  static const route = "/my_page/inquiry/writing";

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
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 100,
                    child: Text(
                      "성명",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Text(
                    controller.user.username,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const SizedBox(
                    width: 100,
                    child: Text(
                      "아이디 (이메일)",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Text(
                    controller.user!.email,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              TextField(
                controller: controller.titleEdit,
                decoration: const InputDecoration(
                  hintText: "제목을 입력하세요.",
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                ),
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: controller.contentsEdit,
                decoration: const InputDecoration(
                  hintText: "내용을 입력하세요.",
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 12,
                  ),
                ),
                style: const TextStyle(fontSize: 12),
                minLines: 8,
                maxLines: null,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    width: 17,
                    height: 17,
                    decoration: BoxDecoration(
                      border: Border.all(color: greyPointColor),
                      borderRadius: BorderRadiusDirectional.circular(4),
                    ),
                    child: Obx(() {
                      return Checkbox(
                        activeColor: Colors.transparent,
                        checkColor: controller.allowReply
                            ? bluePointColor
                            : greyPointColor,
                        value: true,
                        onChanged: (value) {
                          controller.allowReply = !controller.allowReply;
                        },
                      );
                    }),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "이메일 받기",
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 36),
              Obx(() {
                return ExpandedElevatedButton(
                  text: "등록하기",
                  onPressed: !controller.canMoveOn
                      ? null
                      : () {
                          controller.inquire();
                          Get.back();
                        },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
