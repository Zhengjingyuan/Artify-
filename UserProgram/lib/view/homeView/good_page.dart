import 'package:flutter/material.dart';
import 'package:userprogram/base/components/SwipeCards.dart';
import 'package:userprogram/base/provider_widget.dart';
import 'package:userprogram/model/home_good/home_good_bean.dart';
import 'package:userprogram/model/home_good/onchain_bean.dart';
import 'package:userprogram/view/homeView/goodViews/onChain_detail_page.dart';
import 'package:userprogram/viewmodel/getOnChain_viewmodel.dart';
import 'package:provider/provider.dart';

/**
 * 首页
 */
class GoodPage extends StatefulWidget {
  @override
  _GoodPageState createState() => _GoodPageState();
}

class _GoodPageState extends State<GoodPage> {
  GetOnChainGoodViewModel getOnChainGoodViewModel = GetOnChainGoodViewModel();
  List<OnChainGood> onChainGoodList1 = []; // 初始化为一个空列表
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.white), // 边框颜色为白色
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0),
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
          height: 240,
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
        minHeight: 60,
        maxHeight: 60,
        child: Row(
          children: [
            SizedBox(width: 40),
            _buildNavItem(0, '新品上线'),
            _buildNavItem(1, '原创甄选'),
            _buildNavItem(2, '专属推荐'),
            SizedBox(width: 40),
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
                  color: _selectedIndex == index
                      ? Color(0xFF4E3A74).withOpacity(0.9)
                      : Colors.transparent, // 点击时颜色匹配
                  borderRadius: BorderRadius.circular(12.0),
                  border: _selectedIndex == index
                      ? Border.all(
                          color: Color(0xFFFC6AFF).withOpacity(0.0),
                          width: 2.0) // 点击时边框匹配
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

  Widget _listView() {

    return FutureBuilder(
        future:getOnChainGoodViewModel.getOnChainGood1() ,
        builder:(BuildContext context,AsyncSnapshot asyncSnapshot) {
          if(getOnChainGoodViewModel.onChainGoodList1.isNotEmpty){
            debugPrint('done');
            var onChainGoods=getOnChainGoodViewModel.onChainGoodList1;
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
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          padding: EdgeInsets.all(16.0),
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
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(16.0),
                                      image: DecorationImage(
                                        image: NetworkImage(product.imageUrl!),
                                        // 商品图片
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 24.0),
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
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                        SizedBox(height: 8.0),
                                        Text(
                                          '作者：${product.creator}',
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.white),
                                        ),
                                        SizedBox(height: 8.0),
                                        Text(product.description!,
                                            style: TextStyle(
                                                fontSize: 10, color: Colors.white)),
                                        SizedBox(height: 8.0),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      product.type == 0
                                          ? '官方发售'
                                          : product.type == 1
                                          ? '个人原创'
                                          : product.type == 2
                                          ? 'AI 创作'
                                          : '',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white.withOpacity(0.8))),
                                  Text('¥ ${product.price}',
                                      style: TextStyle(
                                          fontSize: 16,
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
          if(getOnChainGoodViewModel.onChainGoodList1.isNotEmpty){
            debugPrint('done');
            var onChainGoods=getOnChainGoodViewModel.onChainGoodList1;
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
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          padding: EdgeInsets.all(16.0),
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
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(16.0),
                                      image: DecorationImage(
                                        image: NetworkImage(product.imageUrl!),
                                        // 商品图片
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 24.0),
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
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                        SizedBox(height: 8.0),
                                        Text(
                                          '作者：${product.creator}',
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.white),
                                        ),
                                        SizedBox(height: 8.0),
                                        Text(product.description!,
                                            style: TextStyle(
                                                fontSize: 10, color: Colors.white)),
                                        SizedBox(height: 8.0),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      product.type == 0
                                          ? '官方发售'
                                          : product.type == 1
                                          ? '个人原创'
                                          : product.type == 2
                                          ? 'AI 创作'
                                          : '',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white.withOpacity(0.8))),
                                  Text('¥ ${product.price}',
                                      style: TextStyle(
                                          fontSize: 16,
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
          if(getOnChainGoodViewModel.onChainGoodList1.isNotEmpty){
            debugPrint('done');
            var onChainGoods=getOnChainGoodViewModel.onChainGoodList1;
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
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          padding: EdgeInsets.all(16.0),
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
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(16.0),
                                      image: DecorationImage(
                                        image: NetworkImage(product.imageUrl!),
                                        // 商品图片
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 24.0),
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
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                        SizedBox(height: 8.0),
                                        Text(
                                          '作者：${product.creator}',
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.white),
                                        ),
                                        SizedBox(height: 8.0),
                                        Text(product.description!,
                                            style: TextStyle(
                                                fontSize: 10, color: Colors.white)),
                                        SizedBox(height: 8.0),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      product.type == 0
                                          ? '官方发售'
                                          : product.type == 1
                                          ? '个人原创'
                                          : product.type == 2
                                          ? 'AI 创作'
                                          : '',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white.withOpacity(0.8))),
                                  Text('¥ ${product.price}',
                                      style: TextStyle(
                                          fontSize: 16,
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
