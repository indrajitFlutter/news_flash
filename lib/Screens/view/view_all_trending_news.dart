import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_flash/Screens/controller/news_controller.dart';

import '../../commonWidgets/blog_tile.dart';
import '../../constants/strings.dart';

class ViewAllTrendingNews extends StatefulWidget {
  const ViewAllTrendingNews({super.key});

  @override
  State<ViewAllTrendingNews> createState() => _ViewAllTrendingNewsState();
}

class _ViewAllTrendingNewsState extends State<ViewAllTrendingNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Strings.trendingNews),),
      body: GetBuilder<NewsController>(
          builder: (newsController) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: newsController.articleModelList.length,
              itemBuilder: (context, index) {
                return BlogTile(url: newsController.articleModelList[index].url, imageUrl: newsController.articleModelList[index].urlToImage, title: newsController.articleModelList[index].title, desc: newsController.articleModelList[index].description);
              },
            );
          }
      ),
    );
  }
}
