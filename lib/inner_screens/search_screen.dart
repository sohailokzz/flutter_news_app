import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../services/utilis.dart';

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
          )
        ],
      )),
    );
  }
}
