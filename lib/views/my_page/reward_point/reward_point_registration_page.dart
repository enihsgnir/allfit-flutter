import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/views/my_page/reward_point/reward_point_registration_controller.dart';
import 'package:allfit_flutter/widgets/default_app_bar.dart';
import 'package:allfit_flutter/widgets/unprepared_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RewardPointRegistrationPage
    extends GetView<RewardPointRegistrationController> {
  const RewardPointRegistrationPage({super.key});

  static const route = "/my_page/reward_point/registration";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: "포인트 등록하기"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 36,
                    child: TextField(
                      controller: controller.codeEdit,
                      decoration: const InputDecoration(
                        hintText: "포인트 코드를 입력해주세요",
                        filled: true,
                        fillColor: backgroundColor,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: const TextStyle(fontSize: 12),
                      textAlignVertical: TextAlignVertical.bottom,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  height: 36,
                  child: Obx(() {
                    return ElevatedButton(
                      onPressed: !controller.canMoveOn
                          ? null
                          : () => showUnpreparedDialog(context),
                      child: const Text(
                        "등록",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              "등록하신 포인트 코드는 즉시 사용가능한 포인트로 지급됩니다.",
              style: TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
