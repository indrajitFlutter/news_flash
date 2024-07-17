import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'articals_view.dart';

class BlogTile extends StatelessWidget {
  String? imageUrl,title,desc,url;
  BlogTile({super.key,required this.imageUrl,required this.title,required this.desc,required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>ArticleView(blogUrl: url));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
        child: Material(
          elevation: 3,
          borderRadius: BorderRadius.circular(10),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl:imageUrl!,
                    fit: BoxFit.cover,
                    width: 120,
                    height: 120,
                  )),
              const SizedBox(width: 20,),
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width/2,
                    child: Text(title!,
                      maxLines: 3,
                      style: const TextStyle( fontSize: 16,fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width/2,
                    child: Text(
                      desc!,
                      maxLines: 3,
                      style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 10,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}