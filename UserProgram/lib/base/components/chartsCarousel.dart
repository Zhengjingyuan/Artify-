import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

/**
 * 月榜的轮播图
 */
class CarouselSliderDemo extends StatefulWidget {
  late final String image1;
  late final String image2;
  late final String image3;
  CarouselSliderDemo({required this.image1,required this.image2,required this.image3});
  @override
  _CarouselSliderDemoState createState() => _CarouselSliderDemoState();
}
class _CarouselSliderDemoState extends State<CarouselSliderDemo> {
  int _currentIndex = 0;
  CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            height: 280,
            aspectRatio: 16/9,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: false,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: [
            cardItem(widget.image1, Colors.white, 'NO1'),
            cardItem(widget.image2, Colors.white, 'NO2'),
            cardItem(widget.image3, Colors.white, 'NO3'),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              width: 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == 0 ? Colors.blue : Colors.grey,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              width: 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == 1 ? Colors.blue : Colors.grey,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              width: 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == 2 ? Colors.blue : Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
  Widget cardItem(String imageUrl, Color color, String number) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: color,
      margin: EdgeInsets.all(16.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 240,
            width: 360,
            child: Stack(
              children: <Widget>[
                Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: 240,
                  width: 360,
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    color: Colors.black54,
                    child: Text(
                      number,
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}