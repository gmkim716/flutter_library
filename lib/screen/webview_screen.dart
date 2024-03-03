import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// URI/URL을 생성하는데 도움을 주는 클래스
final uri = Uri.parse('https://palworld.inven.co.kr');

class WebViewScreen extends StatelessWidget {
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)

    // setNavigationDelegate: 페이지 이동에 대한 이벤트 처리
    ..setNavigationDelegate(NavigationDelegate(onPageFinished: (String url) {
      // print(url);
    }))
    ..loadRequest(uri); // 입력받은 uri 객체를 통해 지정한 사이트로 이동

  WebViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Palworld'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              controller.loadRequest(uri);
            },
            icon: const Icon(
              Icons.home,
            ),
          ),
        ],
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
