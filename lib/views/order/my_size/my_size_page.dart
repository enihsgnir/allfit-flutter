import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MySizePage extends StatefulWidget {
  const MySizePage({super.key});

  static const route = "/order/my_size";

  @override
  State<MySizePage> createState() => _MySizePageState();
}

class _MySizePageState extends State<MySizePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: WebView(
          initialUrl: "https://sizemine.imemine.co.kr/sizemine",
          javascriptMode: JavascriptMode.unrestricted,
          gestureNavigationEnabled: true,
        ),
      ),
    );
  }
}
