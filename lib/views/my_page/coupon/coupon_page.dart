import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/views/my_page/coupon/coupon_controller.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:allfit_flutter/widgets/unprepared_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouponPage extends GetView<CouponController> {
  const CouponPage({super.key});

  static const route = "/my_page/coupon";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: const CustomAppBar(title: "쿠폰 등록하기"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
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
                          hintText: "쿠폰 코드를 입력해주세요",
                          filled: true,
                          fillColor: lightGreyBackgroundColor,
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
              const SizedBox(height: 180),
              const Text(
                "사용 가능한 쿠폰이 없습니다.",
                style: TextStyle(
                  color: greyIconColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
