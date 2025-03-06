import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/use_case.dart';
import '../../core/card_widget.dart';
import '../search_list_view_model.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    SearchListViewModel viewModel = Provider.of<SearchListViewModel>(context);

    return Column(children: [
      const SizedBox(height: 30),
      SizedBox(
        width: 420,
        height: 590,
        child: (viewModel.state == SearchState.finishied)
            ? list(viewModel)
            : Text(
                '입력하지않았음',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              ),
      )
    ]);
  }

  Widget list(viewModel) {
    return ListView(
      children: [
        if (viewModel.items.length > 0)
          for (var item in viewModel.items)
            CardWidget(
              url: '${item.snippet.thumbnailUrl}',
              channelTitle: '${item.snippet.channelTitle}',
              title: '${item.snippet.title}',
              description: '${item.snippet.description}',
              publishedAt: '${item.snippet.publishedAt}',
            ),
      ],
    );
  }
}
