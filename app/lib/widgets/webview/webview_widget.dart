import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWidget extends StatefulWidget {
  final WebViewController controller;
  final VoidCallback initialUrlLoader;

  const WebViewWidget({
    super.key,
    required this.controller,
    required this.initialUrlLoader,
  });

  @override
  State<WebViewWidget> createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.initialUrlLoader();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: widget.controller,
      initialUrlLoader: () {},
    );
  }
}
