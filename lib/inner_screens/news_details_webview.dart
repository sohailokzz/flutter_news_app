import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:news_app/constants/spacing.dart';
import 'package:news_app/widgets/drawer_list_tile.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
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
  final url =
      'https://media.istockphoto.com/id/517188688/photo/mountain-landscape.jpg?s=1024x1024&w=is&k=20&c=MB1-O5fjps0hVPd97fMIiEaisPMEn4XqVvQoJFKLRrQ=';
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
              onPressed: () async {
                await _showModalSheet();
              },
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
                initialUrl: url,
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

  Future<void> _showModalSheet() async {
    await showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              20.ph,
              Container(
                width: 35,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              20.ph,
              const Text(
                'More Option',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              20.ph,
              const Divider(
                thickness: 2,
              ),
              20.ph,
              DrawerListTile(
                label: 'Share',
                icon: Icons.screen_share_rounded,
                onTap: () async {
                  try {
                    await Share.share(
                      'check out my website https://example.com',
                      subject: 'Look what I made!',
                    );
                  } catch (error) {
                    log('Share Error $error');
                  } finally {
                    Navigator.pop(context);
                  }
                },
              ),
              DrawerListTile(
                label: 'Open in Browser',
                icon: Icons.open_in_browser,
                onTap: () async {
                  if (!await launchUrl(
                    Uri.parse(url),
                  )) {
                    throw Exception('Could not launch $url');
                  }
                },
              ),
              DrawerListTile(
                label: 'Refresh',
                icon: Icons.refresh,
                onTap: () async {
                  try {
                    await _webViewController.reload();
                  } catch (error) {
                    log('Error message $error');
                  } finally {
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
