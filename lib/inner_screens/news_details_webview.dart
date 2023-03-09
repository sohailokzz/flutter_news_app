import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../services/utilis.dart';

class NewsDetailsWebview extends StatefulWidget {
  const NewsDetailsWebview({super.key});

  @override
  State<NewsDetailsWebview> createState() => _NewsDetailsWebviewState();
}

class _NewsDetailsWebviewState extends State<NewsDetailsWebview> {
  late WebViewController _webViewController;
  double _progress = 0.0;
  @override
  Widget build(BuildContext context) {
    final size = Utilis(context).getScreen;
    final color = Utilis(context).getColor;
    return WillPopScope(
      onWillPop: () async {
        if (await _webViewController.canGoBack()) {
          _webViewController.goBack();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: color),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Url',
            style: TextStyle(
              color: color,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              IconlyLight.arrowLeft2,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            LinearProgressIndicator(
              value: _progress,
              color: _progress == 1.0 ? Colors.transparent : Colors.blue,
            ),
            Expanded(
              child: WebView(
                initialUrl:
                    'https://media.istockphoto.com/id/517188688/photo/mountain-landscape.jpg?s=1024x1024&w=is&k=20&c=MB1-O5fjps0hVPd97fMIiEaisPMEn4XqVvQoJFKLRrQ=',
                zoomEnabled: true,
                onProgress: (progress) {
                  setState(() {
                    _progress = progress / 100;
                  });
                },
                onWebViewCreated: (controller) {
                  _webViewController = controller;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
