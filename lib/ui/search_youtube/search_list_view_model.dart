import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:portpolio_flutter/data/snippet_model.dart';
import 'package:portpolio_flutter/domain/models/use_case.dart';

class SearchListViewModel with ChangeNotifier {
  SnippetUseCase snippetUseCase;

  SearchState get state => snippetUseCase.currentState;
  List<SearchItemModel> get items => snippetUseCase.items;
  StreamSubscription<SearchState>? subscription;

  SearchListViewModel(this.snippetUseCase) {
    subscription = snippetUseCase.streamingState.listen(
      (data) {
        notifyListeners();
      },
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    subscription?.cancel();
  }
}
