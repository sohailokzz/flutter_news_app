import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/constants/spacing.dart';
import 'package:news_app/constants/vars.dart';
import 'package:news_app/services/utilis.dart';

class NewsDetailsScreen extends StatefulWidget {
  static const routeName = '/NewsDetailsScreen';
  const NewsDetailsScreen({super.key});

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utilis(context).getColor;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Author',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: color,
          ),
        ),
        iconTheme: IconThemeData(color: color),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'title' * 10,
                style: titleTextStyle,
                textAlign: TextAlign.justify,
              ),
              25.ph,
              Row(
                children: [
                  Text(
                    '10/02/2023',
                    style: smallTextStyle,
                    textAlign: TextAlign.justify,
                  ),
                  const Spacer(),
                  Text(
                    'Readingtimetext',
                    style: smallTextStyle,
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
              25.ph,
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextContents(
                label: 'Description',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              10.ph,
              TextContents(
                label: 'Description' * 20,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              )
            ],
          ),
          25.ph,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextContents(
                label: 'Contents',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              10.ph,
              TextContents(
                label: 'Contents' * 20,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class TextContents extends StatelessWidget {
  final String label;
  final double fontSize;
  final FontWeight fontWeight;
  const TextContents({
    super.key,
    required this.label,
    required this.fontSize,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      label,
      textAlign: TextAlign.justify,
      style: GoogleFonts.roboto(
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
