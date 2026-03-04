import 'package:app/helpers/configures/app_config.dart';
import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/widgets/appbar_widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UserGuideScreen extends StatefulWidget {
  const UserGuideScreen({super.key});

  @override
  State<UserGuideScreen> createState() => _UserGuideScreenState();
}

class _UserGuideScreenState extends State<UserGuideScreen> {
  late final WebViewController _webViewController;

  @override
  void initState() {
    super.initState();

    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000));

    _webViewController.loadRequest(
      Uri.parse('${AppConfig.host}membership/userguide/html'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: context.tr.guideButtonText),
      body: WebViewWidget(controller: _webViewController),
    );
  }
}
