import 'package:allfit_flutter/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';

class PaymentHistoryPage extends StatelessWidget {
  const PaymentHistoryPage({super.key});

  static const route = "/my_page/payment_history";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DefaultAppBar(title: "결제내역"),
      body: Placeholder(),
    );
  }
}
