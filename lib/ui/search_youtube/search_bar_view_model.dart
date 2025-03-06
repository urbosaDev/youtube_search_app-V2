import 'package:flutter/widgets.dart';
import 'package:portpolio_flutter/data/snippet_model.dart';
import 'package:portpolio_flutter/domain/models/use_case.dart';

//searchview의 상태만 관리하는 ViewModel
class SearchBarViewModel with ChangeNotifier {
  SnippetUseCase snippetUseCase;
  SearchBarViewModel(this.snippetUseCase);

  Future<void> search(String query) async {
    snippetUseCase.execute(query);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
