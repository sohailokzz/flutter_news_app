import 'package:flutter/material.dart';
import 'package:news_app/services/utilis.dart';

class EmptyNewsWidget extends StatelessWidget {
  final String text;
  final String imagePath;

  const EmptyNewsWidget({
    super.key,
    required this.text,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    Color color = Utilis(context).getColor;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Image.asset(
          imagePath,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: color,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
