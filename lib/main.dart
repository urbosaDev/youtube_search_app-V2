import 'package:flutter/material.dart';
import 'package:portpolio_flutter/data/snippet_repository.dart';
import 'package:portpolio_flutter/domain/models/use_case.dart';
import 'package:portpolio_flutter/ui/search_youtube/screenViewModel.dart';

import 'package:provider/provider.dart';

import 'data/search_snippet_youtube_service.dart';
import 'ui/search_youtube/screen.dart';

void main() {
  runApp(const MyApp());
  // initializer를 따로 넣어서 시작 필요한 domain/data layer 클래스들 초기화
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
          ChangeNotifierProvider<ScreenViewModel>(
            create: (context) => ScreenViewModel(SnippetUseCase(
                SnippetRepository(
                    searchSnippetYoutubeService:
                        SearchSnippetYoutubeService()))),
          ),
        ],
        child: Screen(),
      ),
    );
  }
}
