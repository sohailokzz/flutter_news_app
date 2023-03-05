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
  int currentPageIndex = 0;
  String sortBy = SortByEnum.publishedAt.name;
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
            ),
            newsType == NewsType.topTrending
                ? Container()
                : SizedBox(
                    height: kBottomNavigationBarHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        10.pw,
                        paginationButton(
                          label: 'Prev',
                          function: () {
                            if (currentPageIndex == 0) {
                              return;
                            }
                            setState(() {
                              currentPageIndex -= 1;
                            });
                          },
                        ),
                        Flexible(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    currentPageIndex = index;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  margin: const EdgeInsets.all(8.0),
                                  color: currentPageIndex == index
                                      ? Colors.blue
                                      : Theme.of(context).cardColor,
                                  child: Center(
                                    child: Text('${index + 1}'),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        paginationButton(
                          label: 'Next',
                          function: () {
                            if (currentPageIndex == 4) {
                              return;
                            }
                            setState(() {
                              currentPageIndex += 1;
                            });
                          },
                        ),
                        10.pw,
                      ],
                    ),
                  ),
            10.ph,
            newsType == NewsType.topTrending
                ? Container()
                : Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      color: Theme.of(context).cardColor,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: DropdownButton(
                        value: sortBy,
                        items: dropDownItems,
                        onChanged: (String? value) {
                          setState(() {
                            sortBy = value!;
                          });
                        },
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> get dropDownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        value: SortByEnum.relevancy.name,
        child: Text(
          SortByEnum.relevancy.name,
        ),
      ),
      DropdownMenuItem(
        value: SortByEnum.publishedAt.name,
        child: Text(
          SortByEnum.publishedAt.name,
        ),
      ),
      DropdownMenuItem(
        value: SortByEnum.popularity.name,
        child: Text(
          SortByEnum.popularity.name,
        ),
      ),
    ];
    return menuItems;
  }

  Widget paginationButton({
    required String label,
    required Function function,
  }) {
    return ElevatedButton(
      onPressed: () {
        function();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.all(6.0),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
