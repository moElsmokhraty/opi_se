import 'package:flutter/material.dart';
import 'package:opi_se/core/utils/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DashboardViewBody extends StatelessWidget {
  DashboardViewBody({super.key});

  final WebViewController controller = WebViewController()
    ..enableZoom(true)
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse(
      'https://userdashboard-cv8d.onrender.com/${userCache!.nationalId!}',
    ));

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}
