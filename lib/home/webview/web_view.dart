import 'package:flutter/material.dart';
import 'package:tasks3/home/webview/widget/web_view_body.dart';

class web_view extends StatelessWidget {
  const web_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewPage(url:'https://www.google.com'),
    );
  }
}
