import 'package:flutter/material.dart';

import '../services/utilis.dart';
import 'articel_shimmer_widget.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({super.key});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  BorderRadius borderRadius = BorderRadius.circular(12);
  late Color baseShimmerColor, hightlightShimmerColor, widgetShimmerColor;

  @override
  void didChangeDependencies() {
    var utitlis = Utilis(context);
    baseShimmerColor = utitlis.getBaseShimmerColor;
    hightlightShimmerColor = utitlis.getHighlightShimmerColor;
    widgetShimmerColor = utitlis.getWidgetShimmerColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utilis(context).getScreen;
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(8.0),
        itemCount: 20,
        itemBuilder: (context, index) {
          return ArticleShimmerEffectWidget(
            baseShimmerColor: baseShimmerColor,
            hightlightShimmerColor: hightlightShimmerColor,
            widgetShimmerColor: widgetShimmerColor,
            size: size,
            borderRadius: borderRadius,
          );
        },
      ),
    );
  }
}
