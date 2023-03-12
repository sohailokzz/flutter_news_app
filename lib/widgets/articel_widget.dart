import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:news_app/constants/spacing.dart';
import 'package:news_app/constants/vars.dart';
import 'package:news_app/inner_screens/blog_details.dart';
import 'package:news_app/inner_screens/news_details_webview.dart';
import 'package:page_transition/page_transition.dart';

import '../services/utilis.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = Utilis(context).getScreen;
    return Container(
      margin: const EdgeInsets.all(8.0),
      color: Theme.of(context).cardColor,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            NewsDetailsScreen.routeName,
          );
        },
        child: Stack(
          children: [
            Container(
              height: 60,
              width: 60,
              color: Theme.of(context).secondaryHeaderColor,
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                height: 60,
                width: 60,
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              color: Theme.of(context).cardColor,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FancyShimmerImage(
                      height: size.height * 0.12,
                      width: size.height * 0.12,
                      boxFit: BoxFit.fill,
                      errorWidget: Image.asset('assets/images/empty_image.png'),
                      imageUrl:
                          'https://media.istockphoto.com/id/517188688/photo/mountain-landscape.jpg?s=1024x1024&w=is&k=20&c=MB1-O5fjps0hVPd97fMIiEaisPMEn4XqVvQoJFKLRrQ=',
                    ),
                  ),
                  10.pw,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'data ' * 20,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: smallTextStyle,
                        ),
                        10.ph,
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            '⏰ Reading Time',
                            style: smallTextStyle,
                          ),
                        ),
                        FittedBox(
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      child: const NewsDetailsWebview(),
                                      type: PageTransitionType.rightToLeft,
                                      ctx: context,
                                      inheritTheme: true,
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.link,
                                  color: Colors.blue,
                                ),
                              ),
                              Text(
                                '20-2-2023 ' * 2,
                                style: smallTextStyle,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
