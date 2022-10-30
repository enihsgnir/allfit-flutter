import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/views/my_page/alter_service/alter_service_controller.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:allfit_flutter/widgets/custom_elevated_button.dart';
import 'package:allfit_flutter/widgets/custom_padding.dart';
import 'package:allfit_flutter/widgets/unprepared_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlterServiceChangePage extends GetView<AlterServiceController> {
  const AlterServiceChangePage({super.key});

  static const route = "/my_page/alter_service/change";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            const Text(
              "어떤 요금제로 변경하시겠습니까?",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "다음 결제일에 선택하신 요금제로 변경됩니다.",
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 48),
            CustomElevatedButton(
              height: 56,
              backgroundColor: lightGreyBackgroundColor,
              onPressed: () => showUnpreparedDialog(context),
              child: Row(
                children: const [
                  Image(
                    height: 18,
                    image: AssetImage(
                      "assets/images/icon_alter_service_monthly.png",
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "월정액 서비스",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            CustomElevatedButton(
              height: 56,
              backgroundColor: lightGreyBackgroundColor,
              onPressed: () => showUnpreparedDialog(context),
              child: Row(
                children: const [
                  Image(
                    height: 18,
                    image: AssetImage(
                      "assets/images/icon_alter_service_free.png",
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "자유이용 서비스",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "서비스 즉시 변경은 고객센터를 통해 신청 가능합니다.",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 24),
            CustomElevatedButton(
              onPressed: () => showUnpreparedDialog(context),
              child: const Text(
                "확인",
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
    );
  }
}
