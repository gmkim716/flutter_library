import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewLoadingScreen extends StatefulWidget {
  @override
  State<WebViewLoadingScreen> createState() => _WebViewLoadingScreen();
}

class _WebViewLoadingScreen extends State<WebViewLoadingScreen> {
  // WebViewController 선언
  late final WebViewController _controller;
  final bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    final WebViewController controller = WebViewController();

    controller
      // Javascript가 제한 없이 실행될 수 있도록 설정
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('웹뷰 로딩 중 (progress : $progress%)');
            const CircularProgressIndicator();
          },
          onPageStarted: (url) => {
            debugPrint('_isLoading: $_isLoading'),
          },
          onPageFinished: (url) => {
            debugPrint('_isLoading: $_isLoading'),
          },
        ),
      )
      ..loadRequest(Uri.parse('https://palworld.inven.co.kr/'));

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Palworld'),
        centerTitle: true,
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}
