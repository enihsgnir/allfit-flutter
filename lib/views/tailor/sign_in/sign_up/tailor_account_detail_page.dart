import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/views/home/address/address_search_page.dart';
import 'package:allfit_flutter/views/tailor/main/tailor_main_page.dart';
import 'package:allfit_flutter/views/tailor/sign_in/sign_up/tailor_sign_up_controller.dart';
import 'package:allfit_flutter/views/tailor/sign_in/sign_up/tailor_sign_up_page.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:allfit_flutter/widgets/custom_elevated_button.dart';
import 'package:allfit_flutter/widgets/custom_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TailorAccountDetailPage extends GetView<TailorSignUpController> {
  const TailorAccountDetailPage({super.key});

  static const route = "/tailor/sign_up/detail";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: const CustomAppBar(title: "업체 등록하기"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTopPadding(),
              const Text("업체명"),
              TextField(
                controller: controller.nameEdit,
              ),
              const Text("주소"),
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
              const SizedBox(height: 16),
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
              const Text("전화번호"),
              TextField(
                controller: controller.phoneEdit,
              ),
              const Text("계좌번호"),
              TextField(
                controller: controller.bankAccountEdit,
              ),
              const Text("전문 분야 선택"),
              const Spacer(),
              CustomElevatedButton(
                text: "등록하기",
                onPressed: () async {
                  if (await controller.signUp()) {
                    Get.until(ModalRoute.withName(TailorMainPage.route));
                  } else {
                    Get.until(ModalRoute.withName(TailorSignUpPage.route));
                  }
                },
              ),
              const CustomBottomPadding(),
            ],
          ),
        ),
      ),
    );
  }
}
