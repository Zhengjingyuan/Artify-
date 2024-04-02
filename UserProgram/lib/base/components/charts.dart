import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MaterialApp(
    home: AnimatedCarouselCard(cardList: [
      ClipRRect(
        borderRadius: BorderRadius.circular(16.0), // 设置圆角半径为16.0
        child: Image.asset(
          'lib/assert/art.png',
          fit: BoxFit.cover,
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(16.0), // 设置圆角半径为16.0
        child: Image.asset(
          'lib/assert/music.png',
          fit: BoxFit.cover,
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(16.0), // 设置圆角半径为16.0
        child: Image.asset(
          'lib/assert/virtual.png',
          fit: BoxFit.cover,
        ),
      ),
    ])
  ));
}

class AnimatedCarouselCard extends StatefulWidget {
  final List<Widget> cardList;
  AnimatedCarouselCard({required this.cardList});
  @override
  _AnimatedCarouselCardState createState() => _AnimatedCarouselCardState();
}
class _AnimatedCarouselCardState extends State<AnimatedCarouselCard> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260.0,
      child: CarouselSlider.builder(
        itemCount: widget.cardList.length,
        itemBuilder: (context, index, realIndex) {
          final item = widget.cardList[index];
          return Stack(
            children: [
              Container(
                height: 260,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32.0),
                  child: item,
                ),
              ),
              if (_currentIndex == index)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Color(0xFF655C95).withOpacity(0.7),
                        Color(0xFF3E3878).withOpacity(0.9),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                  ),
                  child:  Text(
                    '《Top${index + 1} ${'Title'}》',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        options: CarouselOptions(
          height: 280.0,
          aspectRatio: 9 / 9,
          viewportFraction: 0.8,
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
      ),
    );
  }
}