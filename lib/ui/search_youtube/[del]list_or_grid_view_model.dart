// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:portpolio_flutter/data/snippet_model.dart';
// import 'package:portpolio_flutter/domain/models/use_case.dart';

// class ListOrGridViewModel with ChangeNotifier {
//   SnippetUseCase snippetUseCase;

//   Stream<SearchState> get streamingState => snippetUseCase.streamingState;
//   Stream<List<SearchItemModel>> get streamingItems =>
//       snippetUseCase.streamingItems;

//   SearchState state = SearchState.idle;
//   // List인지 Grid 인지 여부 상태

//   List<SearchItemModel> items = [];
//   ListOrGridViewModel(this.snippetUseCase) {
//     // 유즈케이스의 데이터 변경을 감지하고 UI 업데이트
//     snippetUseCase.streamingItems.listen(
//       (data) {
//         items = data;
//         notifyListeners();
//       },
//     );

//     snippetUseCase.streamingState.listen(
//       (data) {
//         state = data;
//         notifyListeners();
//       },
//     );
//   }
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//   }
// }
