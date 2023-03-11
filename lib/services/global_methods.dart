import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:news_app/constants/spacing.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../widgets/drawer_list_tile.dart';

class GlobalMethods {
  static Future<void> showErrorDialog({
    required BuildContext context,
    required String errorMessage,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(errorMessage),
          title: Row(
            children: const [
              Icon(
                IconlyBold.danger,
                color: Colors.red,
              ),
              Text('An Error Occured'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: const Text(
                'Ok',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static const url =
      'https://media.istockphoto.com/id/517188688/photo/mountain-landscape.jpg?s=1024x1024&w=is&k=20&c=MB1-O5fjps0hVPd97fMIiEaisPMEn4XqVvQoJFKLRrQ=';

  static Future<void> showModalSheet({
    required BuildContext context,
    required WebViewController webViewController,
  }) async {
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
                    showErrorDialog(
                      context: context,
                      errorMessage: error.toString(),
                    );
                  } finally {
                    Navigator.pop(context);
                  }
                },
              ),
              DrawerListTile(
                label: 'Open in Browser',
                icon: Icons.open_in_browser,
                onTap: () async {
                  try {
                    if (!await launchUrl(
                      Uri.parse(url),
                    )) {}
                  } catch (error) {
                    throw showErrorDialog(
                      context: context,
                      errorMessage: 'Could Not show $url',
                    );
                  }
                },
              ),
              DrawerListTile(
                label: 'Refresh',
                icon: Icons.refresh,
                onTap: () async {
                  try {
                    await webViewController.reload();
                  } catch (error) {
                    showErrorDialog(
                      context: context,
                      errorMessage: error.toString(),
                    );
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
