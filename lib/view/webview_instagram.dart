import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InstagramPost extends StatelessWidget {
  InstagramPost({Key? key}) : super(key: key);
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..loadRequest(Uri.parse('https://www.instagram.com/nowastezindagi/'));
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (await controller.canGoBack()) {
            controller.goBack();
            return false;
          }
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
            title:  Text(
              'Instagram',
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
          body: SafeArea(
              child: WebViewWidget(
            controller: controller,
          )),
        ));
  }
}
