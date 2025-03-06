import 'package:flutter/material.dart';
import 'package:portpolio_flutter/domain/models/use_case.dart';

class ScreenViewModel with ChangeNotifier {
  SnippetUseCase snippetUseCase;
  ScreenViewModel(this.snippetUseCase);
  bool isList = true;
  // 그리드 , 리스트의 상태를 바꾸고 뷰에 알린다.
  void toggleIsListOrGrid() {
    isList = !isList;
    notifyListeners();
  }
}
