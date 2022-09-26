import 'package:allfit_flutter/views/main_controller.dart';
import 'package:allfit_flutter/views/my_page/inquiry/inquiry_writing_page.dart';
import 'package:allfit_flutter/widgets/default_app_bar.dart';
import 'package:allfit_flutter/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class InquiryPage extends GetView<MainController> {
  const InquiryPage({super.key});

  static const route = "/my_page/inquiry";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: "1:1 문의하기"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Text(
              "무엇을 도와드릴까요?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(height: 16),
            const Text(
              "02-1234-5678\n\nallfit@example.com\n\nAM 09:00 ~ PM 18:00 (점심시간 12:00-13:00)\n\nDAY OFF (토/일/공휴일)\n",
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      await launchUrl(Uri.parse("tel:02-1234-5678"));
                    },
                    child: const Text(
                      "전화 상담",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (!controller.isSignedIn) {
                        showToast("로그인 후 이용가능합니다");
                      } else {
                        Get.toNamed(InquiryWritingPage.route);
                      }
                    },
                    child: const Text(
                      "이메일 상담",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
