import 'package:flutter/material.dart';
import 'package:portpolio_flutter/data/snippet_repository.dart';
import 'package:portpolio_flutter/domain/models/use_case.dart';
import 'package:portpolio_flutter/ui/search_youtube/list_or_grid_view_model.dart';
import 'package:portpolio_flutter/ui/search_youtube/screenViewModel.dart';
import 'package:portpolio_flutter/ui/search_youtube/search_bar_view_model.dart';

import 'package:provider/provider.dart';

import 'data/search_snippet_youtube_service.dart';
import 'ui/search_youtube/screen.dart';

void main() {
  runApp(const MyApp());

}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiProvider(
        providers: [
          Provider<SnippetUseCase>(
            create: (context) => SnippetUseCase(
              SnippetRepository(
                searchSnippetYoutubeService: SearchSnippetYoutubeService(),
              ),
            ),
          ),
          ChangeNotifierProvider<SearchBarViewModel>(
            create: (context) => SearchBarViewModel(
              Provider.of<SnippetUseCase>(context, listen: false),
            ),
          ),
          ChangeNotifierProvider<ListOrGridViewModel>(
            create: (context) => ListOrGridViewModel(
              Provider.of<SnippetUseCase>(context, listen: false),
            ),
          ),
          ChangeNotifierProvider<ScreenViewModel>(
            create: (context) => ScreenViewModel(
              Provider.of<SnippetUseCase>(context, listen: false),
            ),
          ),
        ],
        child: Screen(),
      ),
    );
  }
}