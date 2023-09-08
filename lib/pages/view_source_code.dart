import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../configs/configs.dart' as configs;

class ViewSourceCode extends StatelessWidget{
  const ViewSourceCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        ),
        body: WebViewWidget(controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(
            Uri.parse(configs.repoURL),
          ))
    );
  }
}
