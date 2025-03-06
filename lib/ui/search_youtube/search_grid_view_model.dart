import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:portpolio_flutter/data/snippet_model.dart';
import 'package:portpolio_flutter/domain/models/use_case.dart';

class SearchGridViewModel with ChangeNotifier {
  SnippetUseCase snippetUseCase;

  SearchState state = SearchState.idle;
  List<SearchItemModel> get items => snippetUseCase.items;
  StreamSubscription<SearchState>? subscription;
  SearchGridViewModel(this.snippetUseCase) {
    // state가 변할때마다 생성되는 함수
    // 뷰모델에서 state를 생성하고 useCase의 State가 변할때마다 이를 State에 넣음
    subscription = snippetUseCase.streamingState.listen(
      (data) {
        state = data;
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
