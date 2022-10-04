import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/views/my_page/alter_service/alter_service_controller.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:allfit_flutter/widgets/custom_cached_image.dart';
import 'package:allfit_flutter/widgets/custom_elevated_button.dart';
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
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () => showUnpreparedDialog(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: backgroundColor,
                      ),
                      child: Row(
                        children: const [
                          CustomCachedImage(
                            width: 22,
                            path: "icons/alter_service/monthly.png",
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
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () => showUnpreparedDialog(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: backgroundColor,
                      ),
                      child: Row(
                        children: const [
                          CustomCachedImage(
                            width: 22,
                            path: "icons/alter_service/free.png",
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
                  ),
                ),
              ],
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
              text: "확인",
              onPressed: () => showUnpreparedDialog(context),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
