import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:news_app/constants/spacing.dart';
import 'package:news_app/constants/vars.dart';
import '../services/utilis.dart';
import '../widgets/empty_news_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController searchController;
  late final FocusNode searchFocus;
  @override
  void initState() {
    searchController = TextEditingController();
    searchFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    if (mounted) {
      searchController.dispose();
      searchFocus.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = Utilis(context).getScreen;
    final color = Utilis(context).getColor;
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      searchFocus.unfocus();
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      IconlyLight.arrowLeft2,
                    ),
                  ),
                  Flexible(
                    child: TextField(
                      focusNode: searchFocus,
                      controller: searchController,
                      autofocus: true,
                      style: TextStyle(
                        color: color,
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(bottom: 8),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: 'Search',
                        suffix: IconButton(
                          onPressed: () {
                            searchController.clear();
                            searchFocus.unfocus();
                            setState(() {});
                          },
                          icon: const Icon(
                            IconlyLight.closeSquare,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      textInputAction: TextInputAction.search,
                      onEditingComplete: () {},
                    ),
                  ),
                ],
              ),
              10.ph,
              Expanded(
                child: MasonryGridView.count(
                  padding: const EdgeInsets.all(8),
                  itemCount: searchKeyWord.length,
                  crossAxisCount: 4,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: color,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            searchKeyWord[index],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const EmptyNewsWidget(
                text: 'Ops! No result Found',
                imagePath: 'assets/images/search.png',
              )
            ],
          ),
        ),
      ),
    );
  }
}
