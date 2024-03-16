import 'package:flutter/material.dart';
import 'package:userprogram/base/components/SwipeCards.dart';
import 'package:userprogram/base/components/customAppBar.dart';


/**
 * 首页
 */

class GoodPage extends StatefulWidget {
  @override
  _GoodPageState createState() => _GoodPageState();
}

class _GoodPageState extends State<GoodPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget selectedWidget = _listView();
    if (_selectedIndex == 1) {
      selectedWidget = _listView2();
    } else if (_selectedIndex == 2) {
      selectedWidget = _listView3();
    }
    // TODO: implement build
    return Scaffold(
      appBar:CustomAppBar(),
      body: CustomScrollView(
        slivers: [
          _topWidget(),
          _stickyHeader(),
          selectedWidget,
        ],
        physics: const BouncingScrollPhysics(),
      ),
    );
  }

  Widget _topWidget() {
    return SliverToBoxAdapter(
      child:Container(
          height: 300,
          color: Colors.grey[200],
          child: CarouselCard(
            cardList: [
              Container(color: Colors.blue),
              Container(color: Colors.green),
              Container(color: Colors.red),
              Container(color: Colors.orange),
            ],
          )
      ),
    );
  }

  Widget _stickyHeader() {
    return SliverPersistentHeader(
      pinned: true,
      floating: true,
      delegate: _StickyHeaderDelegate(
        minHeight: 50,
        maxHeight: 50,
        child: Row(
          children: [
            _buildNavItem(0, '新品上线'),
            _buildNavItem(1, '原创甄选'),
            _buildNavItem(2, '专属推荐'),
          ],
        ),
      ),
    );
  }
  Widget _buildNavItem(int index, String title) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (_selectedIndex != index) {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              decoration: BoxDecoration(
                color: _selectedIndex == index ? Colors.teal : Colors.grey[300],
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(color: _selectedIndex == index ? Colors.white : Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ),
    );
  }

  Widget _listView() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
              (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color:Colors.black12,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 108,
                        height: 108,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(16.0),
                          image: DecorationImage(
                            image: NetworkImage('https://via.placeholder.com/150'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Product11", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8), // 设置内边距
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black), // 设置边框样式
                                    borderRadius: BorderRadius.circular(20), // 设置圆角边框
                                  ),
                                  child: Text(
                                    '个人原创',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0),
                            Text("Description of the product here...", style: TextStyle(fontSize: 14)),
                            SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("\$20", style: TextStyle(fontSize: 20, color: Colors.green)),
                                Text('限量100份',style: TextStyle(fontSize: 16,color: Colors.black),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          childCount: 50,
        ),
      ),
    );
  }
  Widget _listView2() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
              (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color:Colors.black12,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 108,
                        height: 108,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(16.0),
                          image: DecorationImage(
                            image: NetworkImage('https://via.placeholder.com/150'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Product22", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8), // 设置内边距
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black), // 设置边框样式
                                    borderRadius: BorderRadius.circular(20), // 设置圆角边框
                                  ),
                                  child: Text(
                                    '个人原创',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0),
                            Text("Description of the product here...", style: TextStyle(fontSize: 14)),
                            SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("\$20", style: TextStyle(fontSize: 20, color: Colors.green)),
                                Text('限量100份',style: TextStyle(fontSize: 16,color: Colors.black),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          childCount: 50,
        ),
      ),
    );
  }
  Widget _listView3() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
              (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color:Colors.black12,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 108,
                        height: 108,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(16.0),
                          image: DecorationImage(
                            image: NetworkImage('https://via.placeholder.com/150'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Product33", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8), // 设置内边距
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black), // 设置边框样式
                                    borderRadius: BorderRadius.circular(20), // 设置圆角边框
                                  ),
                                  child: Text(
                                    '个人原创',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0),
                            Text("Description of the product here...", style: TextStyle(fontSize: 14)),
                            SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("\$20", style: TextStyle(fontSize: 20, color: Colors.green)),
                                Text('限量100份',style: TextStyle(fontSize: 16,color: Colors.black),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          childCount: 50,
        ),
      ),
    );
  }
}

class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {

  _StickyHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    // TODO: implement build
    return SizedBox.expand(child: child,);
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => maxHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _StickyHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return (
        maxHeight != oldDelegate.maxHeight ||
            minHeight != oldDelegate.minHeight ||
            child != oldDelegate.child
    );
  }
}
