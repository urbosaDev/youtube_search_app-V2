import 'package:portpolio_flutter/data/search_snippet_youtube_service.dart';
import 'package:portpolio_flutter/data/snippet_model.dart';

class SnippetRepository {
  final SearchSnippetYoutubeService searchSnippetYoutubeService;
  SnippetRepository({required this.searchSnippetYoutubeService});

  Future<SearchBodyModel?> getSnippet(String query) async {
    return await searchSnippetYoutubeService.getSnippet(query);
  }
}
