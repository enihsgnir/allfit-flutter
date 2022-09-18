import 'package:allfit_flutter/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';

class PaymentHistoryPage extends StatelessWidget {
  const PaymentHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: "결제내역"),
    );
  }
}
