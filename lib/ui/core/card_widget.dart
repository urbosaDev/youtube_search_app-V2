import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String url,channelTitle,title,description,publishedAt;
  const CardWidget({super.key, required this.url, required this.channelTitle, required this.title, required this.description, required this.publishedAt});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff0f0f0f),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(url,fit: BoxFit.fitWidth,),//viewModel.items[n].snippet.thumbnails.default.url
            Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),), //viewModel.items[n].snippet.title
            Text(channelTitle,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),), //viewModel.items[n].snippet.channelTitle
            Text(description,style: TextStyle(color: Colors.white),), //viewModel.items[n].snippet.description
            Text(publishedAt,style: TextStyle(color: Colors.white),), //viewModel.items[n].snippet.publishedAt
          ],
        ),
      ),
    );
  }
}
