import 'package:flutter/material.dart';
import 'package:userprogram/base/components/SwipeCards.dart';
import 'package:userprogram/base/components/sss.dart';
import 'package:userprogram/model/home_good/onchain_bean.dart';
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
    description: "description1",
    hotValue: 100,
    id: 1,
    imageUrl: "lib/assert/source_5.png",
    isOnChain: true,
    likeNum: 20,
    name: "name1",
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
    description: "description2",
    hotValue: 50,
    id: 2,
    imageUrl: "lib/assert/source_6.png",
    isOnChain: false,
    likeNum: 10,
    name: "name2",
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
    description: "description1",
    hotValue: 100,
    id: 1,
    imageUrl: "lib/assert/source_5.png",
    isOnChain: true,
    likeNum: 20,
    name: "name1",
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
    description: "description1",
    hotValue: 100,
    id: 1,
    imageUrl: "lib/assert/source_1.png",
    isOnChain: true,
    likeNum: 20,
    name: "name1",
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
                      child: Text('NFT热度排行榜', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Row(
                      children: [
                        SizedBox(width: 80),
                        _buildNavItem(0, '日榜'),
                        _buildNavItem(1, '周榜'),
                        _buildNavItem(2, '月榜'),
                        SizedBox(width: 80),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: selectedWidget,
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 25,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 10),
                        Text(
                          '作品展示',
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
                      height: 25,
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
        padding: EdgeInsets.symmetric(horizontal: 2.0), // 增大左右间隙
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
              padding: EdgeInsets.all(8.0),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                decoration: BoxDecoration(
                  color: _selectedIndex == index ? Color(0xFF4E3A74).withOpacity(0.9) : Colors.transparent, // 点击时颜色匹配
                  borderRadius: BorderRadius.circular(12.0),
                  border: _selectedIndex == index
                      ? Border.all(color: Color(0xFFFC6AFF).withOpacity(0.0), width: 2.0) // 点击时边框匹配
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
                    fontSize: 16.0,
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
        child: CarouselCard(
          cardList: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0), // 设置圆角半径为16.0
              child: Image.asset('lib/assert/art.png', fit: BoxFit.cover, ),

            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0), // 设置圆角半径为16.0
              child: Image.asset('lib/assert/music.png', fit: BoxFit.cover, ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0), // 设置圆角半径为16.0
              child: Image.asset('lib/assert/virtual.png', fit: BoxFit.cover, ),
            ),
          ],
        )
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
        child: CarouselCard(
          cardList: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0), // 设置圆角半径为16.0
              child: Image.asset('lib/assert/art.png', fit: BoxFit.cover, ),

            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0), // 设置圆角半径为16.0
              child: Image.asset('lib/assert/music.png', fit: BoxFit.cover, ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0), // 设置圆角半径为16.0
              child: Image.asset('lib/assert/virtual.png', fit: BoxFit.cover, ),
            ),
          ],
        )
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
        child: CarouselCard(
          cardList: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0), // 设置圆角半径为16.0
              child: Image.asset('lib/assert/art.png', fit: BoxFit.cover, ),

            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0), // 设置圆角半径为16.0
              child: Image.asset('lib/assert/music.png', fit: BoxFit.cover, ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0), // 设置圆角半径为16.0
              child: Image.asset('lib/assert/virtual.png', fit: BoxFit.cover, ),
            ),
          ],
        )
    ),
  );
}

Widget _twoColumnListView() {
  return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
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
                    SizedBox(height: 16.0),
                    Text(product.name!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                    SizedBox(height: 8.0),
                    Text(product.description!, style: TextStyle(fontSize: 14, color: Colors.white)),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                            'lib/assert/iconamoon_heart-thin.png'
                        ),
                        Text(product.likeNum.toString(),style: TextStyle(fontSize: 12,color: Colors.white),),

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
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              height: 120.0,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 8.0),
            Text(
              name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              price,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
