import 'package:flutter/material.dart';
import 'package:portpolio_flutter/ui/search_youtube/screenViewModel.dart';
import 'package:portpolio_flutter/ui/search_youtube/search_bar_view_model.dart';
import 'package:portpolio_flutter/ui/search_youtube/widgets/search_bar_view.dart';
import 'package:portpolio_flutter/ui/search_youtube/widgets/search_grid_view.dart';
import 'package:provider/provider.dart';

import 'search_grid_view_model.dart';
import 'search_list_view_model.dart';
import 'widgets/search_list_view.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenViewModel viewModel = Provider.of<ScreenViewModel>(context);

    return Scaffold(
      backgroundColor: Color(0xff0f0f0f),
      appBar: AppBar(
        backgroundColor: Color(0xff0f0f0f),
        title: Image.asset('assets/images/youtube_logo.png'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () => viewModel.toggleIsListOrGrid(),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.black),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                  alignment: Alignment.centerLeft,
                  side: WidgetStatePropertyAll(
                      BorderSide(color: Colors.white, width: 2)),
                ),
                child: Text(
                  viewModel.isList ? '리스트' : '그리드',
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 30),
              ChangeNotifierProvider<SearchBarViewModel>(
                create: (_) => SearchBarViewModel(viewModel.snippetUseCase),
                child: SearchBarView(),
              ),
              const SizedBox(height: 30),
              viewModel.isList
                  ? ChangeNotifierProvider<SearchListViewModel>(
                      create: (_) =>
                          SearchListViewModel(viewModel.snippetUseCase),
                      child: const SearchListView(),
                    )
                  : ChangeNotifierProvider<SearchGridViewModel>(
                      create: (_) =>
                          SearchGridViewModel(viewModel.snippetUseCase),
                      child: const SearchGridView(),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
