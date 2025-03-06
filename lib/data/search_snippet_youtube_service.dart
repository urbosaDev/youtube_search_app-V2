import 'dart:convert';

import 'package:portpolio_flutter/data/snippet_model.dart';
import 'package:http/http.dart' as http;

abstract interface class SearchService {
  Future<SearchBodyModel?> getSnippet(String query);
}

class SearchSnippetYoutubeService implements SearchService {
  Future<SearchBodyModel?> getSnippet(String query) async {
    final key = 'AIzaSyAUhBgW8AlogBgojlp3zQf63RM6Ybuqk-k';
    final url = Uri.parse(
        'https://www.googleapis.com/youtube/v3/search?part=snippet&q=${query}&key=$key');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final resJsonDecode = jsonDecode(response.body);
      return SearchBodyModel.fromJson(resJsonDecode);
    } else {
      return null;
    }
  }
}
