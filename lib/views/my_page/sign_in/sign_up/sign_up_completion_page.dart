import 'package:allfit_flutter/constants/colors.dart';
import 'package:allfit_flutter/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpCompletionPage extends StatelessWidget {
  const SignUpCompletionPage({super.key});

  static const route = "/sign_up/completion";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 36),
            const LinearProgressIndicator(
              value: 3 / 3,
              backgroundColor: backgroundColor,
              color: semiBlackPointColor,
              minHeight: 4,
            ),
            const Spacer(),
            const FlutterLogo(size: 116),
            const SizedBox(height: 24),
            const Text(
              "간편한 수선생활\n함께 시작해볼까요?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 44,
                    child: ElevatedButton(
                      onPressed: Get.back,
                      child: const Text(
                        "시작하기",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
