import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebScreen extends StatelessWidget {
  WebScreen({super.key, required this.url});
  String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(
          controller: WebViewController()..loadRequest(Uri.parse(url))),
    );
  }
}
