import 'package:flutter/material.dart';
import 'package:userprogram/base/components/chartsCarousel.dart';

/**
 * 排行榜组件
 */
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TagList(),
      ),
    );
  }
}
class TagList extends StatefulWidget {
  @override
  _TagListState createState() => _TagListState();
}
class _TagListState extends State<TagList> {
  String selectedTag = '';
  int _selectIndex=0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildSelectedCard(),//轮播图组件
        Positioned(
            top: 0,
            left: 16,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TagItem('月榜', selectedTag == '月榜', () {
                    setState(() {
                      _selectIndex = 0;
                      selectedTag = selectedTag == '月榜' ? '' : '月榜';
                    });
                  }),
                  TagItem('周榜', selectedTag == '周榜', () {
                    setState(() {
                      _selectIndex=1;
                      selectedTag = selectedTag == '周榜' ? '' : '周榜';
                    });
                  }),
                  TagItem('日榜', selectedTag == '日榜', () {
                    setState(() {
                      _selectIndex=2;
                      selectedTag = selectedTag == '日榜' ? '' : '日榜';
                    });
                  }),
                ],
              ),
            ),
        ),
      ],
    );
  }


  Widget _buildSelectedCard() {
    Widget selectedCard=Card1();
    if (_selectIndex == 0) {
      selectedCard = Card1();
    } else if (_selectIndex == 1) {
      selectedCard = Card2();
    } else if (_selectIndex == 2) {
      selectedCard = Card3();
    }
    return selectedCard;
  }
}
class TagItem extends StatefulWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  TagItem(this.text, this.selected, this.onTap);
  @override
  _TagItemState createState() => _TagItemState();
}
class _TagItemState extends State<TagItem> {
  late double _width;
  late Color _backgroundColor;
  late Color _textColor;
  @override
  void initState() {
    widget.text=='月榜';
    if (widget.text == '月榜') {
      _width = 120.0;
      _backgroundColor = Colors.blue;
      _textColor = Colors.white;
    } else {
      _width = 70.0;
      _backgroundColor = Colors.grey[200]!;
      _textColor = Colors.black;
    }
    super.initState();
  }
  @override
  void didUpdateWidget(TagItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    _width = widget.selected ? 120.0 : 70.0;
    _backgroundColor = widget.selected ? Colors.blue : Colors.grey[200]!;
    _textColor = widget.selected ? Colors.white : Colors.black;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: EdgeInsets.all(16.0),
        margin: EdgeInsets.symmetric(vertical: 10.0),
        width: _width,
        child: Text(
          widget.text,
          style: TextStyle(fontSize: 16.0, color: _textColor),
        ),
      ),
    );
  }
}

class Card1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSliderDemo(image1: 'https://img0.baidu.com/it/u=2903024503,3194874901&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500',
    image2: 'https://img0.baidu.com/it/u=2903024503,3194874901&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500',
    image3: 'https://img0.baidu.com/it/u=2903024503,3194874901&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500',);
  }
}

class Card2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSliderDemo(
      image1: 'https://img0.baidu.com/it/u=2903024503,3194874901&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500',
      image2: 'https://img0.baidu.com/it/u=2903024503,3194874901&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500',
      image3: 'https://img0.baidu.com/it/u=2903024503,3194874901&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500',
    );
  }
}

class Card3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSliderDemo(
      image1:'https://img0.baidu.com/it/u=1888319099,3999960800&fm=253&fmt=auto&app=138&f=JPEG?w=449&h=300',
      image2: 'https://img0.baidu.com/it/u=1888319099,3999960800&fm=253&fmt=auto&app=138&f=JPEG?w=449&h=300',
      image3: 'https://img0.baidu.com/it/u=1888319099,3999960800&fm=253&fmt=auto&app=138&f=JPEG?w=449&h=300',
    );
  }
}
