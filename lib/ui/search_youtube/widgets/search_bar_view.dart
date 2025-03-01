import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../search_bar_view_model.dart';

class SearchBarView extends StatelessWidget {
  final queryTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SearchBarViewModel viewModel = Provider.of<SearchBarViewModel>(context);
    return Row(
      children: [
        Expanded(
            child: TextField(
          controller: queryTextController,
          decoration: const InputDecoration(
            hintText: '검색어를 입력해보세요',
            hintStyle: TextStyle(color: Colors.white60),
            enabledBorder: OutlineInputBorder( // 활성화 상태 테두리
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder( // 포커스 상태 테두리
              borderSide: BorderSide(color: Colors.white),
            ),
            errorBorder: OutlineInputBorder( // 에러 상태 테두리
              borderSide: BorderSide(color: Colors.red), // 에러는 빨간색으로 유지 또는 변경
            ),
            focusedErrorBorder: OutlineInputBorder( // 포커스된 에러 상태 테두리
              borderSide: BorderSide(color: Colors.red), // 에러는 빨간색으로 유지 또는 변경
            ),
          ),
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
        )),
        IconButton(
            onPressed: () {
              viewModel.search(queryTextController.text);
            },
            icon: Icon(
              Icons.search,
              color: Colors.white,
            )),
      ],
    );
  }
}
