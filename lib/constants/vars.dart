import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum NewsType {
  topTrending,
  allNews,
}

enum SortByEnum {
  relevancy,
  popularity,
  publishedAt,
}

TextStyle smallTextStyle = GoogleFonts.montserrat(
  fontSize: 15,
);

const List<String> searchKeyWord = [
  'Football',
  'Python',
  'Flutter',
  'Weather',
  'Crypto',
  'Bitcoin',
  'Meta',
  'Youtube',
  'Netflix',
];
