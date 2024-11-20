import 'package:flutter/material.dart';
import 'package:userprogram/base/components/SwipeCards.dart';
import 'package:userprogram/base/components/charts.dart';
import 'package:userprogram/base/components/sss.dart';
import 'package:userprogram/model/home_good/onchain_bean.dart';
import 'package:userprogram/util/int_extention.dart';
import 'package:userprogram/util/size_fit.dart';
import 'package:userprogram/view/homeView/creatViews/charts_page.dart';
import 'package:userprogram/view/homeView/creatViews/charts_page2.dart';
import 'package:userprogram/view/homeView/creatViews/charts_page3.dart';
import 'package:userprogram/view/homeView/creatViews/create_detail_page.dart';
/**
 * 孵化大厅子页面
 */
List<OnChainGood> onChainGoodList = [
  OnChainGood(
    blockchainAddress: "blockchainAddress1",
    category: "category1",
    commentsNum: 10,
    createdAt: "2022-01-01",
    creator: 1,
    description: "Chilu Mountain",
    hotValue: 100,
    id: 1,
    imageUrl: "lib/assert/mountain.jpg",
    isOnChain: true,
    likeNum: 293,
    name: "Beauty of the East",
    onChainTime: "2022-01-02",
    owner: 1,
    price: 10.5,
    quantity: 1,
    type: 1,
    updatedAt: "2022-01-03",
  ),
  OnChainGood(
    blockchainAddress: "blockchainAddress2",
    category: "category2",
    commentsNum: 5,
    createdAt: "2022-02-01",
    creator: 2,
    description: "DOX Cultural Museum",
    hotValue: 50,
    id: 2,
    imageUrl: "lib/assert/yinhe.png",
    isOnChain: false,
    likeNum: 324,
    name: "The Milky Way",
    onChainTime: "2022-02-02",
    owner: 2,
    price: 5.5,
    quantity: 2,
    type: 2,
    updatedAt: "2022-02-03",
  ),
  OnChainGood(
    blockchainAddress: "blockchainAddress1",
    category: "category1",
    commentsNum: 10,
    createdAt: "2022-01-01",
    creator: 1,
    description: "Ma Hongwei",
    hotValue: 100,
    id: 1,
    imageUrl: "lib/assert/digitmount.png",
    isOnChain: true,
    likeNum: 723,
    name: "Digital mountains",
    onChainTime: "2022-01-02",
    owner: 1,
    price: 10.5,
    quantity: 1,
    type: 1,
    updatedAt: "2022-01-03",
  ),
  OnChainGood(
    blockchainAddress: "blockchainAddress1",
    category: "category1",
    commentsNum: 10,
    createdAt: "2022-01-01",
    creator: 1,
    description: "The Palace Museum",
    hotValue: 100,
    id: 1,
    imageUrl: "lib/assert/liujin.png",
    isOnChain: true,
    likeNum: 861,
    name: "Mountain Gilded",
    onChainTime: "2022-01-02",
    owner: 1,
    price: 10.5,
    quantity: 1,
    type: 1,
    updatedAt: "2022-01-03",
  ),
  // 继续添加其他实例...
];

class CreatePage1 extends StatefulWidget {
  @override
  _CreatePage1State createState() => _CreatePage1State();
}

class _CreatePage1State extends State<CreatePage1> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    HYSizeFit.initialize();
    Widget selectedWidget = Carousel1 (context);
    if (_selectedIndex == 1) {
      selectedWidget = Carousel2(context);
    } else if (_selectedIndex == 2) {
      selectedWidget = Carousel3(context);
    }
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assert/bk.png'), // 替换成你想要设置的背景图片路径
            fit: BoxFit.cover, // 适应容器大小，可以根据需求调整
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Center(
                      child: Text('NFT Popularity Ranking', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Row(
                      children: [
                        SizedBox(width: 80.rpx),
                        _buildNavItem(0, 'Daily'),
                        _buildNavItem(1, 'Weekly'),
                        _buildNavItem(2, 'Monthly'),
                        SizedBox(width: 60),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: selectedWidget,
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 25.rpx,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 10.rpx),
                        Text(
                          'Works show',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 25.rpx,
                    )
                  ),
                  _twoColumnListView()
                ],
                physics: const BouncingScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String title) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.rpx), // 增大左右间隙
        child: GestureDetector(
          onTap: () {
            if (_selectedIndex != index) {
              setState(() {
                _selectedIndex = index;
              });
            }
          },
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(8.rpx),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                decoration: BoxDecoration(
                  color: _selectedIndex == index ? Color(0xFF4E3A74).withOpacity(0.9) : Colors.transparent, // 点击时颜色匹配
                  borderRadius: BorderRadius.circular(12.0),
                  border: _selectedIndex == index
                      ? Border.all(color: Color(0xFFFC6AFF).withOpacity(0.0), width: 2.rpx) // 点击时边框匹配
                      : null,
                  boxShadow: _selectedIndex == index
                      ? [
                    BoxShadow(
                      color: Colors.white10,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    ),
                  ]
                      : null,
                ),
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: TextStyle(
                    color: _selectedIndex == index ? Color(0xFFD9AAFF) : Colors.white, // 点击颜色匹配
                    fontSize: 16.rpx,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget Carousel1(BuildContext  context)  {
  return GestureDetector(
    onTap:(){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChartsPage(), // 替换为您要跳转的页面组件
        ),
      );

    },
    child:  Container(
        child: AnimatedCarouselCard(cardList: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0), // 设置圆角半径为16.0
            child: Image.asset(
              'lib/assert/mountain.jpg',
              fit: BoxFit.fill,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0), // 设置圆角半径为16.0
            child: Image.asset(
              'lib/assert/yinhe.png',
              fit: BoxFit.fill,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0), // 设置圆角半径为16.0
            child: Image.asset(
              'lib/assert/digitmount.png',
              fit: BoxFit.fill,
            ),
          ),
        ],
            titleList: [
              'Langli Mountain',
              'The Milky Way',
              'Digital Mountain',
            ]),
    ),
  );
}

Widget Carousel2(BuildContext  context)  {
  return GestureDetector(
    onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChartsPage2(), // 替换为您要跳转的页面组件
        ),
      );
    },
    child: Container(
        child:  AnimatedCarouselCard(cardList: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0), // 设置圆角半径为16.0
            child: Image.asset(
              'lib/assert/dadao.png',
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0), // 设置圆角半径为16.0
            child: Image.asset(
              'lib/assert/liujin.png',
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0), // 设置圆角半径为16.0
            child: Image.asset(
              'lib/assert/digitmount.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
            titleList: [
              'Avenue',
              'Green Mountain',
              'Digital mountain',
            ]),
    ),
  );
}

Widget Carousel3(BuildContext  context)  {
  return GestureDetector(
    onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChartsPage3(), // 替换为您要跳转的页面组件
        ),
      );
    },
    child: Container(
        child:AnimatedCarouselCard(cardList: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0), // 设置圆角半径为16.0
            child: Image.asset(
              'lib/assert/rose.png',
              fit: BoxFit.fill,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0), // 设置圆角半径为16.0
            child: Image.asset(
              'lib/assert/yinhe.png',
              fit: BoxFit.fill,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0), // 设置圆角半径为16.0
            child: Image.asset(
              'lib/assert/liujin.png',
              fit: BoxFit.fill,
            ),
          ),
        ],
            titleList: [
              'Frozen Rose',
              'Milky Way',
              'Green Mountain',
            ]),
    ),
  );
}

Widget _twoColumnListView() {
  return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.rpx),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.75, // 控制宽高比例，根据实际情况调整
          mainAxisExtent: 270
        ),
        delegate: SliverChildBuilderDelegate(
              (context, index) {
                var product = onChainGoodList[index];
            return GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateDetailPage(product),)
                );
              },
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFEBEBF5).withOpacity(0.2)),
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 145,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(24.0),
                        image: DecorationImage(
                          image: AssetImage(product.imageUrl!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.rpx),
                    Text(product.name!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                    SizedBox(height: 8.rpx),
                    Text(product.description!, style: TextStyle(fontSize: 14, color: Colors.white)),
                    SizedBox(height: 10.rpx,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                            'lib/assert/iconamoon_heart-thin.png'
                        ),
                        Text(product.likeNum.toString(),style: TextStyle(fontSize: 12.rpx,color: Colors.white),),

                      ],
                    )

                  ],
                ),
              ),
            );
          },
          childCount: onChainGoodList.length,
        ),

      )
  );
}


class ProductItem extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  ProductItem({required this.image, required this.name, required this.price});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        padding: EdgeInsets.all(8.rpx),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              height: 120.rpx,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 8.rpx),
            Text(
              name,
              style: TextStyle(fontSize: 16.rpx, fontWeight: FontWeight.bold),
            ),
            Text(
              price,
              style: TextStyle(fontSize: 14.rpx, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
