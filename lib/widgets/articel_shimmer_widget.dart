import 'package:flutter/material.dart';
import 'package:news_app/constants/spacing.dart';
import 'package:shimmer/shimmer.dart';

class ArticleShimmerEffectWidget extends StatelessWidget {
  const ArticleShimmerEffectWidget({
    super.key,
    required this.baseShimmerColor,
    required this.hightlightShimmerColor,
    required this.widgetShimmerColor,
    required this.size,
    required this.borderRadius,
  });

  final Color baseShimmerColor;
  final Color hightlightShimmerColor;
  final Color widgetShimmerColor;
  final Size size;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      color: Theme.of(context).cardColor,
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
            child: Shimmer.fromColors(
              baseColor: baseShimmerColor,
              highlightColor: hightlightShimmerColor,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: widgetShimmerColor,
                      height: size.height * 0.12,
                      width: size.height * 0.12,
                    ),
                  ),
                  10.pw,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: size.height * 0.06,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: borderRadius,
                            color: Colors.red,
                          ),
                        ),
                        10.ph,
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: size.height * 0.02,
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: borderRadius,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        10.ph,
                        FittedBox(
                          child: Row(
                            children: [
                              ClipOval(
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              Container(
                                height: size.height * 0.02,
                                width: size.width * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: borderRadius,
                                  color: Colors.red,
                                ),
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
          ),
        ],
      ),
    );
  }
}
