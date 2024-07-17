import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../Screens/view/category_news.dart';

class CategoryTiles extends StatelessWidget {
  final image, categoryName;

  CategoryTiles({super.key, this.image, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: (){
          Get.to(()=>CategoryNews(name: categoryName));
        },
        child: Container(
          margin: const EdgeInsets.only(right: 10),
          child: Stack(
            children: [
              ClipRect(child: SvgPicture.asset(image, fit: BoxFit.fill, width: 120, height: 60)),
              Container(
                  height: 70,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.black38,
                  ),
                  child: Center(
                      child: Text(
                        categoryName,
                        style: const TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.bold),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
