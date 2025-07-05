import 'package:bookly/Features/home/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';

import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30.0),
        CustomSearchTextField(),
        SizedBox(height: 10.0),
        Expanded(child:  SearchResultListView()),
      ],
    );
  }
}
