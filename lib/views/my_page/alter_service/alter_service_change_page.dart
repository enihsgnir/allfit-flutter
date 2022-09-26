import 'package:allfit_flutter/views/my_page/alter_service/alter_service_controller.dart';
import 'package:allfit_flutter/widgets/default_app_bar.dart';
import 'package:allfit_flutter/widgets/expanded_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlterServiceChangePage extends GetView<AlterServiceController> {
  const AlterServiceChangePage({super.key});

  static const route = "/my_page/alter_service/change";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(),
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
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("월정액 서비스"),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("자유이용 서비스"),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: const [
                Text("서비스 즉시 변경은 고객센터를 통해 신청 가능합니다."),
              ],
            ),
            const SizedBox(height: 24),
            ExpandedElevatedButton(
              text: "확인",
              onPressed: () {},
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
