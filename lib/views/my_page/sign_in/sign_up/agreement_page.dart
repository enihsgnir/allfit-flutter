import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/views/my_page/sign_in/sign_up/sign_up_controller.dart';
import 'package:allfit_flutter/views/my_page/sign_in/sign_up/sign_up_page.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:allfit_flutter/widgets/custom_padding.dart';
import 'package:allfit_flutter/widgets/unprepared_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgreementPage extends GetView<SignUpController> {
  const AgreementPage({super.key});

  static const route = "/sign_up/agreement";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 36),
            const LinearProgressIndicator(
              value: 1 / 4,
              backgroundColor: lightGreyBackgroundColor,
              color: semiBlackIconColor,
              minHeight: 4,
            ),
            const SizedBox(height: 24),
            const Text(
              "스마트한 수선 생활\n얼핏으로 시작해 보세요 !",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Obx(() {
                    return Checkbox(
                      activeColor: Colors.transparent,
                      checkColor: controller.isAllChecked
                          ? bluePointColor
                          : greyIconColor,
                      splashRadius: 16,
                      value: true,
                      onChanged: (value) {
                        final isAllChecked = controller.isAllChecked;
                        controller.terms = !isAllChecked;
                        controller.privacy = !isAllChecked;
                        controller.notification = !isAllChecked;
                        controller.commercial = !isAllChecked;
                      },
                    );
                  }),
                ),
                const SizedBox(width: 8),
                const Text(
                  "모두 동의하기",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Obx(() {
                    return Checkbox(
                      activeColor: Colors.transparent,
                      checkColor:
                          controller.terms ? bluePointColor : greyIconColor,
                      splashRadius: 16,
                      value: true,
                      onChanged: (value) {
                        controller.terms = !controller.terms;
                      },
                    );
                  }),
                ),
                const SizedBox(width: 8),
                const Text(
                  "[필수] 서비스 이용약관 동의",
                  style: TextStyle(fontSize: 11),
                ),
                InkWell(
                  onTap: () => showUnpreparedDialog(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 12,
                    ),
                    child: const Text(
                      "보기",
                      style: TextStyle(
                        fontSize: 10,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Obx(() {
                    return Checkbox(
                      activeColor: Colors.transparent,
                      checkColor:
                          controller.privacy ? bluePointColor : greyIconColor,
                      splashRadius: 16,
                      value: true,
                      onChanged: (value) {
                        controller.privacy = !controller.privacy;
                      },
                    );
                  }),
                ),
                const SizedBox(width: 8),
                const Text(
                  "[필수] 개인정보 처리방침 동의",
                  style: TextStyle(fontSize: 11),
                ),
                InkWell(
                  onTap: () => showUnpreparedDialog(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 12,
                    ),
                    child: const Text(
                      "보기",
                      style: TextStyle(
                        fontSize: 10,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Obx(() {
                    return Checkbox(
                      activeColor: Colors.transparent,
                      checkColor: controller.notification
                          ? bluePointColor
                          : greyIconColor,
                      splashRadius: 16,
                      value: true,
                      onChanged: (value) {
                        controller.notification = !controller.notification;
                      },
                    );
                  }),
                ),
                const SizedBox(width: 8),
                const Text(
                  "[필수] 서비스 알림 수신",
                  style: TextStyle(fontSize: 11),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Obx(() {
                    return Checkbox(
                      activeColor: Colors.transparent,
                      checkColor: controller.commercial
                          ? bluePointColor
                          : greyIconColor,
                      splashRadius: 16,
                      value: true,
                      onChanged: (value) {
                        controller.commercial = !controller.commercial;
                      },
                    );
                  }),
                ),
                const SizedBox(width: 8),
                const Text(
                  "[선택] 서비스 혜택 정보 수신",
                  style: TextStyle(fontSize: 11),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 44,
                    child: Obx(() {
                      return ElevatedButton(
                        onPressed: !controller.canMoveOn
                            ? null
                            : () => Get.toNamed(SignUpPage.route),
                        child: const Text(
                          "동의 후 가입하기",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }),
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
