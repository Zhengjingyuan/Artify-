import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

/**
 * 首页的轮播图组件
 */

class CarouselCard extends StatelessWidget {
  final List<Widget> cardList;
  CarouselCard({required this.cardList});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 180.0,
          aspectRatio: 16 / 9,
          viewportFraction: 0.7,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
        items: cardList.map((item) {
          return ClipRRect( // 只在这里添加ClipRRect，移除Container
            borderRadius: BorderRadius.circular(32.0),
            child: item,
          );
        }).toList(),
      ),
    );
  }
}