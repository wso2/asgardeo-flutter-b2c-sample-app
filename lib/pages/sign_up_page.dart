import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../configs/configs.dart';
import '../configs/end_point_urls.dart';
import '../constants/strings.dart';

class SignUpWebView extends StatelessWidget{
  const SignUpWebView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text(Strings.newAccount),
    ),
    body: WebViewWidget(controller: WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
          NavigationDelegate(
            onNavigationRequest: (NavigationRequest request) {
              if(request.url.startsWith(accessURL)){
                Navigator.pop(context);
                return NavigationDecision.navigate;
              }
              return NavigationDecision.navigate;
            },
          )
      )
      ..loadRequest(
        Uri.parse(signUpUrl),
      ))
    );
  }
}
