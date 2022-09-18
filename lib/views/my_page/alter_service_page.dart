import 'package:allfit_flutter/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';

class AlterServicePage extends StatelessWidget {
  const AlterServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DefaultAppBar(title: "이용 중인 서비스"),
      body: Placeholder(),
    );
  }
}
