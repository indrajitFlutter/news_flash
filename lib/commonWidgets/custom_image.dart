import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget customImage(BuildContext context, String image, String name, int index) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 5.0),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: image,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            height: 250,
          ),
        ),
        Container(
          height: 250,
          padding: const EdgeInsets.only(left: 10),
          margin: const EdgeInsets.only(top: 170.0),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)), color: Colors.black26),
          child: Text(
            name,
            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          ),
        )
      ],
    ),
  );
}
