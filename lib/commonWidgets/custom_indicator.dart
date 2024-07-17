import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget customIndicator(BuildContext context,int activeIndex,int count){
  return AnimatedSmoothIndicator(activeIndex:activeIndex ,count: 6,effect: const SlideEffect(dotWidth: 15,dotHeight: 15,activeDotColor: Colors.blue,),);
}