import 'package:allfit_flutter/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';

class MyInfoPage extends StatelessWidget {
  const MyInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DefaultAppBar(title: "내 정보"),
      body: Placeholder(),
    );
  }
}