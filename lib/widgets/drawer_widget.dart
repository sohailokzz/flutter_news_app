import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/constants/spacing.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import 'drawer_list_tile.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Drawer(
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Image.asset(
                      'assets/images/newspaper.png',
                      height: 60,
                      width: 60,
                    ),
                  ),
                  20.ph,
                  Text(
                    'News App',
                    style: GoogleFonts.lobster(
                      fontSize: 20,
                      letterSpacing: 0.6,
                    ),
                  ),
                ],
              ),
            ),
            20.ph,
            DrawerListTile(
              icon: IconlyBold.home,
              label: 'Home',
              onTap: () {},
            ),
            DrawerListTile(
              icon: IconlyBold.bookmark,
              label: 'Bookmark',
              onTap: () {},
            ),
            const Divider(
              thickness: 3,
            ),
            SwitchListTile.adaptive(
                title: Text(
                  themeProvider.getDarkTheme ? 'Dark' : 'Light',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                secondary: Icon(
                  themeProvider.getDarkTheme
                      ? Icons.dark_mode
                      : Icons.light_mode,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                value: themeProvider.getDarkTheme,
                onChanged: (bool value) {
                  setState(() {
                    themeProvider.setDarkTheme = value;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
