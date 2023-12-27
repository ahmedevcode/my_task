import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:tasks3/home/setting/widget/setting_body.dart';
import 'package:webview_flutter/webview_flutter.dart';



class WebViewPage extends StatefulWidget {
  final String url;

  WebViewPage({required this.url});

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web View Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: WebViewContainer(
             // key: _webViewKey,
              initialUrl: widget.url,
            ),
          ),
          NetworkDevicesDropdown(),
        ],
      ),
    );
  }
}

class WebViewContainer extends StatefulWidget {
  final String initialUrl;

  WebViewContainer({Key? key, required this.initialUrl}) : super(key: key);

  @override
  WebViewContainerState createState() => WebViewContainerState();
}

class WebViewContainerState extends State<WebViewContainer> {
  late WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: widget.initialUrl,
      onWebViewCreated: (WebViewController webViewController) {
        _webViewController = webViewController;
      },
    );
  }

  // Additional methods for interacting with the WebView
  void reload() {
    if (_webViewController != null) {
      _webViewController.reload();
    }
  }

  void goBack() {
    if (_webViewController != null) {
      _webViewController.goBack();
    }
  }

  void goForward() {
    if (_webViewController != null) {
      _webViewController.goForward();
    }
  }
}

