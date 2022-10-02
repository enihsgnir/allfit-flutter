import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static const route = "/my_page/settings";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "설정"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("준비 중입니다."),
          ],
        ),
      ),
    );
  }
}
