//use - case 에서 데이터 보관해야함
// viewModel 에서 접근할때 useCase에서 꺼내쓸수있도록
// 또한 결과는 boolean 이어야 함.
// 각각 Item 들은 snippet 와 videoId로 구성되어있고, 타고타고 해서 들어가야함
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portpolio_flutter/data/snippet_model.dart';
import 'package:portpolio_flutter/data/snippet_repository.dart';

enum SearchState {
  idle, // 검색 전
  loading, // 검색 진행중 CircularProgress
  finishied, // 완료상태 : 검색 완료 -> ListView 띄우기
  error, // 에러상태
}
// enum

class SnippetUseCase {
  List<SearchItemModel> items = [];

  SearchState _currentState = SearchState.idle;
  SearchState get currentState => _currentState;
  final SnippetRepository snippetRepository;
  SnippetUseCase(this.snippetRepository);


  // state는 각 뷰모델에 state를 공유한다
  final _stateController = StreamController<SearchState>.broadcast();
  Stream<SearchState> get streamingState => _stateController.stream;

  Future<void> execute(String query) async {
    // _stateController?.close();
    _stateController.sink.add(SearchState.loading);
    try {
      final res = await snippetRepository.getSnippet(query);
      if (res != null) {
        print("#search $res");
        items = res.items;
        _currentState = SearchState.finishied;
        _stateController.sink.add(SearchState.finishied);
      } else {
        _currentState = SearchState.error;
        _stateController.sink.add(SearchState.error);
      }
    } catch (e) {
      _currentState = SearchState.error;
      _stateController.sink.add(SearchState.error);
    } finally {
      //완료 되었으니 다시 검색전 상태로 이동
      // _stateController.sink.add(SearchState.idle);
    }
  }
}
