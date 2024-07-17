import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_flash/Screens/controller/news_controller.dart';

import '../../commonWidgets/blog_tile.dart';
import '../../constants/strings.dart';

class ViewAllBrakingNews extends StatefulWidget {
  const ViewAllBrakingNews({super.key});

  @override
  State<ViewAllBrakingNews> createState() => _ViewAllBrakingNewsState();
}

class _ViewAllBrakingNewsState extends State<ViewAllBrakingNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(Strings.breakingNews,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 22))),),
      body: GetBuilder<NewsController>(
        builder: (newsController) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: newsController.sliderList.length,
            itemBuilder: (context, index) {
              return BlogTile(url: newsController.sliderList[index].url, imageUrl: newsController.articleModelList[index].urlToImage, title: newsController.sliderList[index].title, desc: newsController.sliderList[index].description);
            },
          );
        }
      ),
    );
  }
}
