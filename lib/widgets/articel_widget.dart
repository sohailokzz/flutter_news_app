import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

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
        onTap: () {},
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
                      imageUrl:
                          'https://media.istockphoto.com/id/517188688/photo/mountain-landscape.jpg?s=1024x1024&w=is&k=20&c=MB1-O5fjps0hVPd97fMIiEaisPMEn4XqVvQoJFKLRrQ=',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
