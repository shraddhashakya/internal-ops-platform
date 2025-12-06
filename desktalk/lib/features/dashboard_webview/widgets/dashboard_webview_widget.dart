import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DashboardWebviewWidget extends StatefulWidget {
  final Uri url;
  const DashboardWebviewWidget({super.key, required this.url});

  @override
  State<DashboardWebviewWidget> createState() => _DashboardWebviewWidgetState();
}

class _DashboardWebviewWidgetState extends State<DashboardWebviewWidget> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: _controller);
  }
}
