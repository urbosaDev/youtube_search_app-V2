import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:portpolio_flutter/data/snippet_model.dart';
import 'package:portpolio_flutter/domain/models/use_case.dart';

class ListOrGridViewModel with ChangeNotifier {
  SnippetUseCase snippetUseCase;

  SearchState state = SearchState.idle;
  List<SearchItemModel> get items_ => snippetUseCase.items;

  // screen view model 로 이동
  // List인지 Grid 인지 여부 상태
  bool isListOrGrid = true;
  // 그리드 , 리스트의 상태를 바꾸고 뷰에 알린다.
  void toggleIsListOrGrid() {
    isListOrGrid = !isListOrGrid;
    notifyListeners();
  }

  ListOrGridViewModel(this.snippetUseCase) {
    // 유즈케이스의 데이터 변경을 감지하고 UI 업데이트
    // snippetUseCase.streamingItems.listen(
    //   (data) {
    //     items = data;
    //     notifyListeners();
    //   },
    // );

    snippetUseCase.streamingState.listen(
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
  }
}
