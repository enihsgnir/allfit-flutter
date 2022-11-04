import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MySizePage extends StatefulWidget {
  const MySizePage({super.key});

  static const route = "/order/my_size";

  @override
  State<MySizePage> createState() => _MySizePageState();
}

class _MySizePageState extends State<MySizePage> {
  late final WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: "http://sizemine.co.kr/hyundai/view",
          javascriptMode: JavascriptMode.unrestricted,
          gestureNavigationEnabled: true,
          onWebViewCreated: (controller) {
            this.controller = controller;
          },
        ),
      ),
    );
  }
}
