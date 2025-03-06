// import 'package:flutter/material.dart';
// import 'package:portpolio_flutter/ui/search_youtube/list_or_grid_view_model.dart';
// import 'package:provider/provider.dart';

// import '../../../domain/models/use_case.dart';
// import '../../core/card_widget.dart';

// class ListOrGridView extends StatelessWidget {
//   const ListOrGridView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     ListOrGridViewModel viewModel = Provider.of<ListOrGridViewModel>(context);

//     return Column(
//         children: [
      
//       const SizedBox(height: 30),
//       SizedBox(
//         width: 420,
//         height: 590,
//         child: (viewModel.state == SearchState.finishied) ? ((viewModel.isListOrGrid) ? list(viewModel):grid(viewModel)) : Text('입력하지않았음',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
//       )
//     ]);
//   }

//   Widget list(viewModel) {
//     return ListView(
//       children: [
//         if (viewModel.items.length > 0)
//           for (var item in viewModel.items)
//             CardWidget(
//               url: '${item.snippet.thumbnailUrl}',
//               channelTitle: '${item.snippet.channelTitle}',
//               title: '${item.snippet.title}',
//               description: '${item.snippet.description}',
//               publishedAt: '${item.snippet.publishedAt}',
//             ),
//       ],
//     );
//   }

//   Widget grid(viewModel) {
//     return GridView.count(
//       crossAxisCount: 2,
//       mainAxisSpacing: 15,
//       crossAxisSpacing: 8,

//       children: [
//         if (viewModel.items.length > 0)
//           for (var item in viewModel.items)
//             CardWidget(
//               url: '${item.snippet.thumbnailUrl}',
//               channelTitle: '${item.snippet.channelTitle}',
//               title: '${item.snippet.title}',
//               description: '${item.snippet.description}',
//               publishedAt: '${item.snippet.publishedAt}',
//             ),
//       ],
//     );
//   }
// }
