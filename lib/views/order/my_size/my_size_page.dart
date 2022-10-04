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
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () async {
              await controller.runJavascript(
                "window.Flutter('{'key': 'value'}')",
              );
            },
            child: const Text("test"),
          ),
        ],
      ),
      body: SafeArea(
        child: WebView(
          initialUrl: "https://sizemine.imemine.co.kr/sizemine",
          javascriptMode: JavascriptMode.unrestricted,
          gestureNavigationEnabled: true,
          javascriptChannels: {
            JavascriptChannel(
              name: "Flutter",
              onMessageReceived: (message) {},
            ),
          },
          onWebViewCreated: (controller) {
            this.controller = controller;
          },
        ),
      ),
    );
  }
}
