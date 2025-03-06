class SearchBodyModel {
  final List<SearchItemModel> items;
  SearchBodyModel({required this.items});

  factory SearchBodyModel.fromJson(Map<String, dynamic> json) {
    final items = (json['items'] as List)
        .map((item) => SearchItemModel.fromJson(item))
        .toList();
    return SearchBodyModel(items: items);
  }
}

// 각각의 items를 담은 모델
// id와 snippet만을 받는다. id와 snippet 모두 객체
class SearchItemModel {
  final SearchSnippetModel snippet;
  final String videoId;
  SearchItemModel({required this.snippet, required this.videoId});

  factory SearchItemModel.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as Map<String, dynamic>;
    final videoId = id['videoId'] as String;
    final snippet = SearchSnippetModel.fromJson(json['snippet']);
    return SearchItemModel(snippet: snippet, videoId: videoId);
  }
}
//각각의 items 설계서

class SearchSnippetModel {
  final String publishedAt,
      channelId,
      title,
      description,
      channelTitle,
      thumbnailUrl;

  SearchSnippetModel({
    required this.publishedAt,
    required this.channelId,
    required this.title,
    required this.description,
    required this.channelTitle,
    required this.thumbnailUrl,
  });

  factory SearchSnippetModel.fromJson(Map<String, dynamic> json) {
    final publishedAt = json['publishedAt'] as String;
    final channelId = json['channelId'] as String;
    final title = json['title'] as String;
    final description = json['description'] as String;
    final channelTitle = json['channelTitle'] as String;
    final thumbnails = json['thumbnails'] as Map<String, dynamic>;
    final defaultThumbnail = thumbnails['default'] as Map<String, dynamic>;
    final thumbnailUrl = defaultThumbnail['url'] as String;
    return SearchSnippetModel(
      publishedAt: publishedAt,
      channelId: channelId,
      title: title,
      description: description,
      channelTitle: channelTitle,
      thumbnailUrl: thumbnailUrl,
    );
  }
}
