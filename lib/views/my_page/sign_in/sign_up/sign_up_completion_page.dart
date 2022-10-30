import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:allfit_flutter/widgets/custom_elevated_button.dart';
import 'package:allfit_flutter/widgets/custom_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpCompletionPage extends StatelessWidget {
  const SignUpCompletionPage({super.key});

  static const route = "/sign_up/completion";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 36),
            const LinearProgressIndicator(
              value: 4 / 4,
              backgroundColor: lightGreyBackgroundColor,
              color: semiBlackIconColor,
              minHeight: 4,
            ),
            const Spacer(),
            const Image(
              width: 144,
              image: AssetImage("assets/images/sign_up_completion.png"),
            ),
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
            CustomElevatedButton(
              onPressed: Get.back,
              child: const Text(
                "시작하기",
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
