// import 'package:flutter/material.dart';
// import 'package:portpolio_flutter/ui/core/card_widget.dart';
// import 'package:portpolio_flutter/ui/search_youtube/search_bar_view_model.dart';
// import 'package:provider/provider.dart';
//
// import '../../../domain/models/use_case.dart';
//
// class SearchView extends StatelessWidget {
//   final queryTextController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     SearchBarViewModel viewModel = Provider.of<SearchBarViewModel>(context);
//     Widget body() {
//       switch (viewModel.state) {
//         case SearchState.idle:
//           return Center(
//             child: Text('검색어를 입력해주세요~'),
//           );
//         case SearchState.loading:
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         case SearchState.finishied:
//           return Center(
//             child: Text('검색d완료'),
//           );
//         case SearchState.error:
//           return Center(
//             child: Text('에러가 발생했습니다.'),
//           );
//       }
//     }
//
//     Widget searchBar() {
//       return Row(
//         children: [
//           Expanded(
//               child: TextField(
//             controller: queryTextController,
//             decoration: InputDecoration(hintText: '검색어를 입력해보세요'),
//           )),
//           IconButton(
//               onPressed: () {
//                 print('${queryTextController.text}');
//                 viewModel.search(queryTextController.text);
//                 print(viewModel.items.length);
//                 print(viewModel.items[0].snippet.title);
//               },
//               icon: Icon(Icons.search)),
//         ],
//       );
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('검색창입니다'),
//       ),
//       body: Column(
//         children: [
//           searchBar(),
//           body(),
//           if (viewModel.state == SearchState.finishied && viewModel.items != null)
//             for (var item in viewModel.items)
//               CardWidget(
//                 url: '${item.snippet.thumbnailUrl}',
//                 channelTitle: '${item.snippet.channelTitle}',
//                 title: '${item.snippet.title}',
//                 description: '${item.snippet.description}',
//                 publishedAt: '${item.snippet.publishedAt}',
//               ),
//
//         ],
//       ),
//     );
//   }
// }
