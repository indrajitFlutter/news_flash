import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_flash/Screens/view/settings.dart';
import 'package:news_flash/Screens/view/view_all_braeking_news.dart';
import 'package:news_flash/Screens/view/view_all_trending_news.dart';
import 'package:news_flash/commonWidgets/custom_info_text_widget.dart';
import '../../commonWidgets/custom_web_view.dart';
import '../../commonWidgets/blog_tile.dart';
import '../../commonWidgets/category_tiles.dart';
import '../../commonWidgets/custom_image.dart';
import '../../commonWidgets/custom_indicator.dart';
import '../../constants/strings.dart';
import '../controller/news_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final newsController = Get.find<NewsController>();

  getInitData() async {
    await newsController.getCategories();
    await newsController.getSliderNewsData(context);
    await newsController.getNewsArticlesData(context);
  }

  @override
  void initState() {
    newsController.clearController();
    getInitData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
      builder: (newsController) {
        return Scaffold(
            appBar: AppBar(
              title: Center(
                  child: Text(
                Strings.newsFlash,
                    style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
              )),
              actions: [
                IconButton(
                  onPressed: () {
                    Get.to(() => const SettingsPage());
                  },
                  icon: const Icon(Icons.settings),
                )
              ],
            ),
            body: GetBuilder<NewsController>(builder: (controller) {
              return controller.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.categoryDetailsModelList.length,
                              itemBuilder: (context, index) {
                                return CategoryTiles(image: controller.categoryDetailsModelList[index].image, categoryName: controller.categoryDetailsModelList[index].categoryName);
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomInfoText(text: Strings.breakingNews,fontWeight: FontWeight.bold,fontSize: 18,),

                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => const ViewAllBrakingNews());
                                  },
                                  child:CustomInfoText(text: Strings.viewAll,fontWeight: FontWeight.bold,fontSize: 18,color: Colors.blue,)
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          controller.sliderList.isEmpty?const CircularProgressIndicator():
                          CarouselSlider.builder(
                              itemCount: controller.sliderList.isEmpty ? 0 : controller.sliderList.length,
                              itemBuilder: (context, index, realIndex) {
                                return GestureDetector(
                                    onTap: () {
                                      if(index!=0) {
                                        Get.to(() => CustomWebView(blogUrl: controller.sliderList[index].url));
                                      }
                                    },
                                    child: customImage(context, controller.sliderList[index].urlToImage!, controller.sliderList[index].title!, index));
                              },
                              options: CarouselOptions(
                                height: 250,
                                enlargeCenterPage: true,
                                enlargeStrategy: CenterPageEnlargeStrategy.height,
                                autoPlay: true,
                                onPageChanged: (index, reason) {
                                  controller.changeSliderPage(index);
                                },
                              )),
                          const SizedBox(
                            height: 10,
                          ),

                          customIndicator(context, controller.activeIndex, controller.sliderList.length),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Strings.trendingNews,
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => const ViewAllTrendingNews());
                                  },
                                  child: Text(
                                    Strings.viewAll,
                                    style: const TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                          ),
                          controller.articleModelList.isEmpty?const CircularProgressIndicator()
                          :ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.articleModelList.length,
                            itemBuilder: (context, index) {
                              return BlogTile(url: controller.articleModelList[index].url, imageUrl: controller.articleModelList[index].urlToImage, title: controller.articleModelList[index].title, desc: controller.articleModelList[index].description);
                            },
                          )
                        ],
                      ),
                    );
            }));
      },
    );
  }
}
