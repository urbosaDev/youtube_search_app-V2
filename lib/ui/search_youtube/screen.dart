import 'package:flutter/material.dart';
import 'package:portpolio_flutter/ui/search_youtube/screenViewModel.dart';
import 'package:portpolio_flutter/ui/search_youtube/widgets/list_or_grid_view.dart';
import 'package:portpolio_flutter/ui/search_youtube/widgets/search_bar_view.dart';
import 'package:provider/provider.dart';



class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenViewModel viewModel = Provider.of<ScreenViewModel>(context);


    return Scaffold(
      backgroundColor: Color(0xff0f0f0f),
      appBar: AppBar(
        backgroundColor: Color(0xff0f0f0f),
        title: Image.asset('assets/images/youtube_logo.png'),
        centerTitle: false,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          SearchBarView(),
          const SizedBox(height: 30),
          ListOrGridView(),
        ],
      ),
    );
  }
}