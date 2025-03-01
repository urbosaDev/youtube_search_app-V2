import 'package:flutter/material.dart';
import 'package:portpolio_flutter/domain/models/use_case.dart';


class ScreenViewModel with ChangeNotifier {
  SnippetUseCase snippetUseCase;
  ScreenViewModel(this.snippetUseCase);


}