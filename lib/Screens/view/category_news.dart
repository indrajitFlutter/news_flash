import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_flash/commonWidgets/alert_message.dart';
import 'package:news_flash/commonWidgets/custom_web_view.dart';

import '../controller/news_controller.dart';

class CategoryNews extends StatefulWidget {
  String name;

  CategoryNews({super.key, required this.name});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  var controller = Get.find<NewsController>();
  @override
  void initState() {
    // controller.showCategoryModelList.clear();
    controller.getNewsCategoryData(context, widget.name.toLowerCase());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Center(
                child: Text(
                  widget.name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                ),
              ),
              centerTitle: true,
            ),
            body: controller.showCategoryModelList.isEmpty?const Center(child: CircularProgressIndicator()):SizedBox(
              child:ListView.builder(
                shrinkWrap: true,
                itemCount: controller.showCategoryModelList.length,
                itemBuilder: (context, index) {
                  return ShowCategory(url:controller.showCategoryModelList[index].url!, title: controller.showCategoryModelList[index].title!, desc: controller.showCategoryModelList[index].description!, image: controller.showCategoryModelList[index].urlToImage!);
                },)
              ,
            ),
          );
        }
    );
  }
}

class ShowCategory extends StatelessWidget {
  String image, desc, title,url;

  ShowCategory({super.key, required this.title, required this.desc, required this.image,required this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: image,
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          GestureDetector(
            onTap: (){
              Get.to(()=>CustomWebView(blogUrl:url ));
            },
            child: Column(
              children: [
                const SizedBox(height:15),
                Text(title,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                const SizedBox(height:5),
                Text(desc,style: const TextStyle(fontSize: 14,),)
              ],
            ),
          )

        ],
      ),
    );
  }
}
