import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/utils/text_formatters.dart';
import 'package:allfit_flutter/views/home/address/address_search_page.dart';
import 'package:allfit_flutter/views/main_page.dart';
import 'package:allfit_flutter/views/my_page/sign_in/sign_up/sign_up_completion_page.dart';
import 'package:allfit_flutter/views/my_page/sign_in/sign_up/sign_up_controller.dart';
import 'package:allfit_flutter/views/my_page/sign_in/sign_up/sign_up_page.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:allfit_flutter/widgets/custom_elevated_button.dart';
import 'package:allfit_flutter/widgets/custom_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountDetailPage extends GetView<SignUpController> {
  const AccountDetailPage({super.key});

  static const route = "/sign_up/detail";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 36),
              const LinearProgressIndicator(
                value: 3 / 4,
                backgroundColor: lightGreyBackgroundColor,
                color: semiBlackIconColor,
                minHeight: 4,
              ),
              const SizedBox(height: 24),
              const Text(
                "회원정보를 입력해주세요.",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 44),
              const Text(
                "얼핏 닉네임",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              TextFormField(
                controller: controller.nicknameEdit,
                decoration: const InputDecoration(
                  hintText: "닉네임",
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                ),
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 24),
              const Text(
                "주소 정보",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      readOnly: true,
                      controller: controller.postCodeEdit,
                      decoration: const InputDecoration(
                        hintText: "우편번호",
                        contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      ),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(
                          AddressSearchPage.route,
                          arguments: [
                            controller.postCodeEdit,
                            controller.roadAddressEdit,
                          ],
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 48,
                        decoration: BoxDecoration(
                          color: lightGreyBackgroundColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          "우편번호 검색",
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              TextFormField(
                readOnly: true,
                controller: controller.roadAddressEdit,
                decoration: const InputDecoration(
                  hintText: "주소",
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                ),
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: controller.detailAddressEdit,
                decoration: const InputDecoration(
                  hintText: "상세주소",
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                ),
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 24),
              const Text(
                "연락처",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              TextFormField(
                controller: controller.phoneEdit,
                decoration: const InputDecoration(
                  hintText: "연락처",
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                ),
                keyboardType: TextInputType.phone,
                style: const TextStyle(fontSize: 12),
                toolbarOptions: const ToolbarOptions(),
                inputFormatters: [PhoneNumberInputFormatter()],
              ),
              const Spacer(),
              CustomElevatedButton(
                onPressed: () async {
                  if (await controller.signUp()) {
                    Get.offNamedUntil(
                      SignUpCompletionPage.route,
                      ModalRoute.withName(MainPage.route),
                    );
                  } else {
                    Get.until(ModalRoute.withName(SignUpPage.route));
                  }
                },
                child: const Text(
                  "다음",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const CustomBottomPadding(),
            ],
          ),
        ),
      ),
    );
  }
}
