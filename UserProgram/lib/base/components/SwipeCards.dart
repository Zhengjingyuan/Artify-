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
      padding: EdgeInsets.all(16.0),
      height: 200.0, // 添加固定高度作为约束
      child: CarouselSlider(
        options: CarouselOptions(
          height: 400.0,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
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
        items: cardList
            .map((item) => Container(
          child: item,
        ))
            .toList(),
      ),
    );
  }
}