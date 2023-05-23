import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Web extends StatefulWidget {
  const Web({super.key});

  @override
  State<Web> createState() => _WebState();
}

class _WebState extends State<Web> {
  late final WebViewController webViewController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    webViewController = WebViewController()
      ..loadRequest(Uri.parse('https://www.google.com'));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: WebViewWidget(
        controller: webViewController,
      ),
    ));
  }
}
