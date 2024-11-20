import 'package:flutter/material.dart';
import 'package:userprogram/base/components/SwipeCards.dart';
import 'package:userprogram/base/provider_widget.dart';
import 'package:userprogram/model/home_good/home_good_bean.dart';
import 'package:userprogram/model/home_good/onchain_bean.dart';
import 'package:userprogram/util/int_extention.dart';
import 'package:userprogram/view/homeView/goodViews/onChain_detail_page.dart';
import 'package:userprogram/viewmodel/getOnChain_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:userprogram/util/size_fit.dart';

/**
 * 首页
 */
class GoodPage extends StatefulWidget {
  @override
  _GoodPageState createState() => _GoodPageState();
}
/**
 * 商品数据list
 */
List<OnChainGood> onChainGoodList = [
  OnChainGood(
    blockchainAddress: "blockchainAddress1",
    category: "category1",
    commentsNum: 10,
    createdAt: "2022-01-01",
    creator: 1,
    description: "Virtual reality and augmented reality technologies enable viewers to experience in a more immersive way. Through virtual reality technology, viewers can perfectly present the dazzling light and dazzling effects of neon lights on digital platforms. Through high-definition imaging technology, every digital collectible can display detailed neon light patterns and colors with extremely high clarity. Viewers can almost personally feel the wonderful light of neon lights flashing, as if they are in the ocean of neon lights.",
    hotValue: 100,
    id: 1,
    imageUrl: "lib/assert/source_4.png",//image
    isOnChain: true,
    likeNum: 293,
    name: "Mid Journey",
    onChainTime: "2022-01-02",
    owner: 1,
    price: 10.5,
    quantity: 1,
    type: 1,
    updatedAt: "2022-01-03",
    authorName: 'Moonlight Museum'//author
  ),
  OnChainGood(
    blockchainAddress: "blockchainAddress2",
    category: "category2",
    commentsNum: 5,
    createdAt: "2022-02-01",
    creator: 2,
    description: "The artist presents the patterns and decorations of blue and white porcelain in holographic form. Holographic imaging technology endows these digital collections with a sense of three dimensionality and realism, allowing viewers to experience the magnificent beauty of blue and white porcelain up close. The holographic effect brings the details and textures of blue and white porcelain to life, showcasing its unique charm.",
    hotValue: 50,
    id: 2,
    imageUrl: "lib/assert/source_3.png",
    isOnChain: false,
    likeNum: 324,
    name: "Holographic porcelain",
    onChainTime: "2022-02-02",
    owner: 2,
    price: 5.5,
    quantity: 2,
    type: 2,
    updatedAt: "2022-02-03",
    authorName: 'Xinhua Museum'
  ),
  OnChainGood(
    blockchainAddress: "blockchainAddress1",
    category: "category1",
    commentsNum: 10,
    createdAt: "2022-01-01",
    creator: 1,
    description: "Digital mountains and rivers, with the integration of modern technology and art, present magnificent mountain and river landscapes in digital form. This innovative form of expression allows people to immerse themselves in the vastness and magnificence of nature, and appreciate the infinite possibilities of the digital world.",
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
    authorName: 'lolo'
  ),
  OnChainGood(
    blockchainAddress: "blockchainAddress1",
    category: "category1",
    commentsNum: 10,
    createdAt: "2022-01-01",
    creator: 1,
    description: "The work is mainly set against the backdrop of the Yellow River Basin, depicting continuous mountains, winding rivers, vast plains, and abundant pastoral scenery. At the same time, the painting also depicts people's living scenes, such as farmers farming, pedestrians traveling, fishermen fishing, as well as buildings such as temples, palaces, and bridges.",
    hotValue: 100,
    id: 1,
    imageUrl: "lib/assert/source_1.png",
    isOnChain: true,
    likeNum: 861,
    name: "Dance Painting",
    onChainTime: "2022-01-02",
    owner: 1,
    price: 10.5,
    quantity: 1,
    type: 1,
    updatedAt: "2022-01-03",
    authorName: 'Maly'
  ),
  // 继续添加其他实例...
];

class _GoodPageState extends State<GoodPage> {

  GetOnChainGoodViewModel getOnChainGoodViewModel = GetOnChainGoodViewModel();
  List<OnChainGood> onChainGoodList1 = []; // 初始化为一个空列表
  int _selectedIndex = 0;



  @override
  Widget build(BuildContext context) {
    HYSizeFit.initialize();
    Widget selectedWidget = _listView();
    if (_selectedIndex == 1) {
      selectedWidget = _listView2();
    } else if (_selectedIndex == 2) {
      selectedWidget = _listView3();
    }
    debugPrint(_selectedIndex.toString());
    // TODO: implement build
    return ChangeNotifierProvider<GetOnChainGoodViewModel>(
        create: (_) => GetOnChainGoodViewModel()..getOnChainGood1(),
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assert/bk.png'), // 替换成你想要设置的背景图片路径
                fit: BoxFit.cover, // 适应容器大小，可以根据需求调整
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 8.rpx,),
                _searchWidget(),
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      _topWidget(),
                      // Container()
                      SliverToBoxAdapter(
                        child: Container(
                          height: 30,
                          child: Center(
                            child: Text(
                              'Explore NFT',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                        ),
                      ),
                      _stickyHeader(),
                      selectedWidget,
                    ],
                    physics: const BouncingScrollPhysics(),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _searchWidget() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0, // 阴影去除
      title: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Image.asset('lib/assert/彩心带字.png',width: 48.rpx,height: 48.rpx,)
          ),
          Expanded(
            child: Container(
              height: 50.rpx,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.white,width: 1.rpx), // 边框颜色为白色
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.rpx),
                    child: Icon(Icons.search, color: Colors.white), // 图标颜色为白色
                  ),
                  Expanded(
                    child: TextField(
                      style: const TextStyle(color: Colors.white), // 文字颜色为白色
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                            color: Colors.white
                                .withOpacity(0.5)), // 提示文字颜色为白色，透明度为0.5
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 15.rpx),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _topWidget() {
    return SliverToBoxAdapter(
      child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16.0),
          ),
          height: 240.rpx,
          child: CarouselCard(
            cardList: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0), // 设置圆角半径为16.0
                child: Image.asset(
                  'lib/assert/Group 43028.png',
                  fit: BoxFit.cover,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0), // 设置圆角半径为16.0
                child: Image.asset(
                  'lib/assert/Group 43030.png',
                  fit: BoxFit.cover,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0), // 设置圆角半径为16.0
                child: Image.asset(
                  'lib/assert/Group 43027.png',
                  fit: BoxFit.cover,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0), // 设置圆角半径为16.0
                child: Image.asset(
                  'lib/assert/Group 43029.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )),
    );
  }

  Widget _stickyHeader() {
    return SliverPersistentHeader(
      pinned: false,
      floating: true,
      delegate: _StickyHeaderDelegate(
        minHeight: 60.rpx,
        maxHeight: 60.rpx,
        child: Row(
          children: [
            SizedBox(width: 20.rpx),
            _buildNavItem(0, 'New product'),
            _buildNavItem(1, 'Original'),
            _buildNavItem(2, 'Recommend'),
            SizedBox(width: 20.rpx),
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
                  color: _selectedIndex == index
                      ? Color(0xFF4E3A74).withOpacity(0.9)
                      : Colors.transparent, // 点击时颜色匹配
                  borderRadius: BorderRadius.circular(12.0),
                  border: _selectedIndex == index
                      ? Border.all(
                          color: Color(0xFFFC6AFF).withOpacity(0.0),
                          width: 2.rpx) // 点击时边框匹配
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
                    color: _selectedIndex == index
                        ? Color(0xFFD9AAFF)
                        : Colors.white, // 点击颜色匹配
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

  Widget _listView() {

    return FutureBuilder(
        future:getOnChainGoodViewModel.getOnChainGood1() ,
        builder:(BuildContext context,AsyncSnapshot asyncSnapshot) {
          if(true){
            debugPrint('done');
            var onChainGoods=onChainGoodList;
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    if (onChainGoods.isEmpty) {
                      return const CircularProgressIndicator();
                    } else {
                      var product = onChainGoods[index];
                      debugPrint(
                          'ui层Item ID: ${product.id}, Item Name: ${product.name}');
                      // 进行相关操作
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => OnChainDetailPage(product),)
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 8.rpx,horizontal: 8.rpx),
                          padding: EdgeInsets.all(16.rpx),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xFFEBEBF5).withOpacity(0.2)), // 白色边框
                            color: Colors.white.withOpacity(0.1), // 透明背景
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 100.rpx,
                                    height: 100.rpx,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(16.0),
                                      image: DecorationImage(
                                        image: AssetImage(product.imageUrl!),
                                        // 商品图片
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 24.rpx),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(product.name!,
                                                style: TextStyle(
                                                    fontSize: 20.rpx,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                        SizedBox(height: 8.rpx),
                                        Text(
                                          'author：${product.authorName}',
                                          style: TextStyle(
                                              fontSize: 12.rpx, color: Colors.white),
                                        ),
                                        SizedBox(height: 8.rpx),
                                        Text(product.description!,
                                            style: TextStyle(
                                                fontSize: 10.rpx, color: Colors.white),
                                        maxLines: 2,
                                        overflow: TextOverflow.visible,),
                                        SizedBox(height: 8.rpx),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8.rpx,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      product.type == 0
                                          ? 'Official release'
                                          : product.type == 1
                                          ? 'Personal creation'
                                          : product.type == 2
                                          ? 'AI creation'
                                          : '',
                                      style: TextStyle(
                                          fontSize: 16.rpx,
                                          color: Colors.white.withOpacity(0.8))),
                                  Text('¥ ${product.price}',
                                      style: TextStyle(
                                          fontSize: 16.rpx,
                                          color: Colors.white.withOpacity(0.8))),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                  childCount: onChainGoods.length
              ),
            );
          } else if (asyncSnapshot.hasError) {
            debugPrint('error');
            // 数据加载出错时显示错误提示的UI
            return SliverToBoxAdapter(
              child: Container(),
            );
          } else{
            debugPrint('11');
            return SliverToBoxAdapter(
              child:Container(),
            );

          }
        }
    );

  }

  Widget _listView2() {
    return FutureBuilder(
        future:getOnChainGoodViewModel.getOnChainGood1() ,
        builder:(BuildContext context,AsyncSnapshot asyncSnapshot) {
          if(true){
            debugPrint('done');
            var onChainGoods=onChainGoodList;
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    if (onChainGoods.isEmpty) {
                      return const CircularProgressIndicator();
                    } else {
                      var product = onChainGoods[index];
                      debugPrint(
                          'ui层Item ID: ${product.id}, Item Name: ${product.name}');
                      // 进行相关操作
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => OnChainDetailPage(product),)
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 8.rpx,horizontal: 8.rpx),
                          padding: EdgeInsets.all(16.rpx),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xFFEBEBF5).withOpacity(0.2)), // 白色边框
                            color: Colors.white.withOpacity(0.1), // 透明背景
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 100.rpx,
                                    height: 100.rpx,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(16.0),
                                      image: DecorationImage(
                                        image: AssetImage(product.imageUrl!),
                                        // 商品图片
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 24.rpx),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(product.name!,
                                                style: TextStyle(
                                                    fontSize: 20.rpx,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                        SizedBox(height: 8.rpx),
                                        Text(
                                          'author：${product.authorName}',
                                          style: TextStyle(
                                              fontSize: 12.rpx, color: Colors.white),
                                        ),
                                        SizedBox(height: 8.rpx),
                                        Text(product.description!,
                                          style: TextStyle(
                                              fontSize: 10.rpx, color: Colors.white),
                                          maxLines: 2,
                                          overflow: TextOverflow.visible,),
                                        SizedBox(height: 8.rpx),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8.rpx,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      product.type == 0
                                          ? 'Official release'
                                          : product.type == 1
                                          ? 'Personal creation'
                                          : product.type == 2
                                          ? 'AI creation'
                                          : '',
                                      style: TextStyle(
                                          fontSize: 16.rpx,
                                          color: Colors.white.withOpacity(0.8))),
                                  Text('¥ ${product.price}',
                                      style: TextStyle(
                                          fontSize: 16.rpx,
                                          color: Colors.white.withOpacity(0.8))),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                  childCount: onChainGoods.length
              ),
            );
          } else if (asyncSnapshot.hasError) {
            debugPrint('error');
            // 数据加载出错时显示错误提示的UI
            return SliverToBoxAdapter(
              child: Container(),
            );
          } else{
            debugPrint('11');
            return SliverToBoxAdapter(
              child:Container(),
            );

          }
        }
    );
  }

  Widget _listView3() {
    return FutureBuilder(
        future:getOnChainGoodViewModel.getOnChainGood1() ,
        builder:(BuildContext context,AsyncSnapshot asyncSnapshot) {
          if(true){
            debugPrint('done');
            var onChainGoods=onChainGoodList;
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    if (onChainGoods.isEmpty) {
                      return const CircularProgressIndicator();
                    } else {
                      var product = onChainGoods[index];
                      debugPrint(
                          'ui层Item ID: ${product.id}, Item Name: ${product.name}');
                      // 进行相关操作
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => OnChainDetailPage(product),)
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 8.rpx,horizontal: 8.rpx),
                          padding: EdgeInsets.all(16.rpx),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xFFEBEBF5).withOpacity(0.2)), // 白色边框
                            color: Colors.white.withOpacity(0.1), // 透明背景
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 100.rpx,
                                    height: 100.rpx,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(16.0),
                                      image: DecorationImage(
                                        image: AssetImage(product.imageUrl!),
                                        // 商品图片
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 24.rpx),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(product.name!,
                                                style: TextStyle(
                                                    fontSize: 20.rpx,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                        SizedBox(height: 8.rpx),
                                        Text(
                                          '作者：${product.authorName}',
                                          style: TextStyle(
                                              fontSize: 12.rpx, color: Colors.white),
                                        ),
                                        SizedBox(height: 8.rpx),
                                        Text(product.description!,
                                          style: TextStyle(
                                              fontSize: 10.rpx, color: Colors.white),
                                          maxLines: 2,
                                          overflow: TextOverflow.visible,),
                                        SizedBox(height: 8.rpx),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8.rpx,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      product.type == 0
                                          ? 'Official release'
                                          : product.type == 1
                                          ? 'Personal creation'
                                          : product.type == 2
                                          ? 'AI creation'
                                          : '',
                                      style: TextStyle(
                                          fontSize: 16.rpx,
                                          color: Colors.white.withOpacity(0.8))),
                                  Text('¥ ${product.price}',
                                      style: TextStyle(
                                          fontSize: 16.rpx,
                                          color: Colors.white.withOpacity(0.8))),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                  childCount: onChainGoods.length
              ),
            );
          } else if (asyncSnapshot.hasError) {
            debugPrint('error');
            // 数据加载出错时显示错误提示的UI
            return SliverToBoxAdapter(
              child: Container(),
            );
          } else{
            debugPrint('11');
            return SliverToBoxAdapter(
              child:Container(),
            );

          }
        }
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
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return SizedBox.expand(
      child: child,
    );
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
    return (maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child);
  }
}
