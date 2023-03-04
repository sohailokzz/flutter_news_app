import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/constants/spacing.dart';
import '../constants/vars.dart';
import '../services/utilis.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/tabs_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var newsType = NewsType.allNews;
  @override
  Widget build(BuildContext context) {
    final Color color = Utilis(context).getColor;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: color,
            ),
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Text(
              'News App',
              style: GoogleFonts.lobster(
                fontSize: 20,
                letterSpacing: 0.6,
                color: color,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  IconlyLight.search,
                ),
              ),
            ],
          ),
          drawer: const DrawerWidget(),
          body: Column(
            children: [
              Row(
                children: [
                  TabsWidget(
                    label: 'All News',
                    color: newsType == NewsType.allNews
                        ? Theme.of(context).cardColor
                        : Colors.transparent,
                    fontSize: newsType == NewsType.allNews ? 22 : 14,
                    function: () {
                      if (newsType == NewsType.allNews) {
                        return;
                      }
                      setState(() {
                        newsType = NewsType.allNews;
                      });
                    },
                  ),
                  20.pw,
                  TabsWidget(
                    label: 'Top Trending',
                    color: newsType == NewsType.topTrending
                        ? Theme.of(context).cardColor
                        : Colors.transparent,
                    fontSize: newsType == NewsType.topTrending ? 22 : 14,
                    function: () {
                      if (newsType == NewsType.topTrending) {
                        return;
                      }
                      setState(() {
                        newsType = NewsType.topTrending;
                      });
                    },
                  ),
                ],
              )
            ],
          )),
    );
  }
}
