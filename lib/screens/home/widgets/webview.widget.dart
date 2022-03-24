import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:tokio_marine/shared/utils/colors/colors.dart';

class WebviewWidget extends StatefulWidget {
  const WebviewWidget({Key? key}) : super(key: key);

  @override
  State<WebviewWidget> createState() => _WebviewWidgetState();
}

class _WebviewWidgetState extends State<WebviewWidget> {
  double _progress = 0;
  late InAppWebViewController _webViewController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsModel.backgroundColor,
        title: const Text("Webview"),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse('https://flutter.dev/')),
        onWebViewCreated: (InAppWebViewController controller) {
          _webViewController = controller;
        },
        onProgressChanged: (InAppWebViewController controller, int progress) {
          setState(() {
            _progress = progress / 100;
          });
        },
      ),
    );
  }
}
