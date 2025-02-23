import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/app_text_styles.dart';
import '../home/home_page.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CupertinoSearchTextField(
                  controller: textEditingController,
                  onChanged: (query) {
                    // setState(() {
                    //   _searchQuery = query;
                    // });
                  },
                  placeholder: 'Search Messages',
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                  onSubmitted: (value) {
                    print("Search for: $value");
                  },
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent Searches',
                      style: AppTextStyles.heading3,
                    ),
                    Text(
                      'clear all',
                      style: AppTextStyles.captionPrimary,
                    ),
                  ],
                ),
                SearchTile(),
                SearchTile(),
                SearchTile(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Picks',
                      style: AppTextStyles.heading3,
                    ),
                    Text(
                      'see all',
                      style: AppTextStyles.captionPrimary,
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                SizedBox(
                  height: 240,
                  child: ListView(
                    scrollDirection:Axis.horizontal,
                    children: [
                      CarouselListTile(),
                      CarouselListTile(),
                      CarouselListTile(),
                      CarouselListTile(),
                      CarouselListTile(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchTile extends StatelessWidget {
  const SearchTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        spacing: 10,
        children: [
          Icon(CupertinoIcons.search,),
          Text('Subway'),
        ],
      ),
    );
  }
}
