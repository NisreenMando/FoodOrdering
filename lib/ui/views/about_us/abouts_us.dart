import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutsUs extends StatefulWidget {
  const AboutsUs({Key? key}) : super(key: key);

  @override
  State<AboutsUs> createState() => _AboutsUsState();
}

class _AboutsUsState extends State<AboutsUs> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: WebView(
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl: 'https://flutter.dev',
    ));
  }
}
