import 'package:allfit_flutter/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DepositInfoPage extends StatelessWidget {
  const DepositInfoPage({super.key});

  static const route = "/order/deposit";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 45),
            FlutterLogo(size: 100),
            Text(
              "홍길동의 KB국민은행 계좌로\n15,000원을 보내주세요",
              textAlign: TextAlign.center,
            ),
            Text("KB국민 000000-00-000000"),
            IconButton(
              onPressed: () async {
                await Clipboard.setData(
                  const ClipboardData(text: "KB국민 000000-00-000000"),
                );
              },
              icon: Icon(Icons.copy),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterLogo(size: 36),
                Text("입금이 확인되면 수거가 시작됩니다"),
              ],
            ),
            IconButton(
              onPressed: Get.back,
              icon: Icon(Icons.home),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
