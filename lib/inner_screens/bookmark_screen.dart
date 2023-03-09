import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/utilis.dart';
import '../widgets/empty_news_widget.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({super.key});

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  @override
  Widget build(BuildContext context) {
    final size = Utilis(context).getScreen;
    final Color color = Utilis(context).getColor;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: color,
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'BookMarks',
          style: GoogleFonts.lobster(
            fontSize: 20,
            letterSpacing: 0.6,
            color: color,
          ),
        ),
        centerTitle: true,
      ),
      body: const EmptyNewsWidget(
        text: "You didn't add anything yet to the bookmark",
        imagePath: 'assets/images/bookmark.png',
      ),
    );
  }
}


//  ListView.builder(
//         itemCount: 20,
//         itemBuilder: (context, index) {
//           return const ArticleWidget();
//         },
//       ),