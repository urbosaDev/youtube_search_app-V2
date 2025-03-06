import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/use_case.dart';
import '../../core/card_widget.dart';
import '../search_grid_view_model.dart';

class SearchGridView extends StatelessWidget {
  const SearchGridView({super.key});

  @override
  Widget build(BuildContext context) {
    SearchGridViewModel viewModel = Provider.of<SearchGridViewModel>(context);

    return Column(children: [
      const SizedBox(height: 30),
      SizedBox(
        width: 420,
        height: 590,
        child: (viewModel.state == SearchState.finishied)
            ? grid(viewModel)
            : Text(
                '입력하지않았음',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              ),
      )
    ]);
  }

  Widget grid(viewModel) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 15,
      crossAxisSpacing: 8,
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
