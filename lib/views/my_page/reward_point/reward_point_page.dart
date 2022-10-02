import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/views/my_page/reward_point/reward_point_registration_page.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:allfit_flutter/widgets/unprepared_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RewardPointPage extends StatelessWidget {
  const RewardPointPage({super.key});

  static const route = "/my_page/reward_point";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "포인트 현황"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 36),
            const Text(
              "1,317P",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "한달 내 소멸 예정 포인트",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "0P",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            InkWell(
              onTap: () {
                Get.toNamed(RewardPointRegistrationPage.route);
              },
              child: Container(
                alignment: Alignment.center,
                height: 34,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  "포인트 코드 등록",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 80),
            const Text(
              "포인트 이용 내역",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(color: Colors.black),
            InkWell(
              onTap: () => showUnpreparedDialog(context),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "자유 요금제 결제",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "2022년 XX월 XX일",
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Text(
                      "- 5,000P",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            const Spacer(),
            const Text(
              "포인트 이용 유의사항️",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "포인트는 수거 신청일 기준이 아닌 배송 이후 결제 시점에서\n사용되며 월정액서비스는 서비스 결제 시 사용됩니다.",
              style: TextStyle(fontSize: 11),
            ),
            const SizedBox(height: 4),
            const Text(
              "유효기간이 만료되면 포인트는 자동 소멸됩니다.",
              style: TextStyle(fontSize: 11),
            ),
            const SizedBox(height: 52),
          ],
        ),
      ),
    );
  }
}
