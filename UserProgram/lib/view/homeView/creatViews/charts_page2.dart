import 'package:flutter/material.dart';
import 'package:userprogram/base/components/charts.dart';
import 'package:userprogram/util/int_extention.dart';
import 'package:userprogram/util/size_fit.dart';
import 'package:userprogram/viewmodel/weekly_viewmodel.dart';

import '../../../model/home_good/onchain_bean.dart';

/**
 * 日榜数据list
 */
List<OnChainGood> weeklyRankList = [
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

void main() {
  runApp(MaterialApp(
    home: ChartsPage2(),
  ));
}

class ChartsPage2 extends StatefulWidget {
  const ChartsPage2({super.key});

  @override
  State<ChartsPage2> createState() => _ChartsPage2State();
}

class _ChartsPage2State extends State<ChartsPage2> {

  GetWeeklyRankViewModel getWeeklyRankViewModel = GetWeeklyRankViewModel();
  @override
  Widget build(BuildContext context) {
    HYSizeFit.initialize();
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
            AppBar(
              title: Text('Weekly',style: TextStyle(color: Color(0xFFD9AAFF),fontSize: 48.rpx,fontWeight: FontWeight.bold),),
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            SizedBox(
              height: 10.rpx,
            ),
            AnimatedCarouselCard(cardList: [
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
            SizedBox(height: 30.rpx,),
            Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.rpx),
                  padding: EdgeInsets.fromLTRB(16.rpx, 16.rpx, 16.rpx, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    color: Colors.white.withOpacity(0.1),
                  ),
                  child: CustomScrollView(
                    slivers: [
                      FutureBuilder(
                          future:getWeeklyRankViewModel.getWeeklyRank(),
                          builder:(BuildContext context,AsyncSnapshot asyncSnapshot) {
                            if(true){
                              debugPrint('done');
                              var dailyGoods=weeklyRankList;
                              return SliverList(
                                delegate: SliverChildBuilderDelegate(
                                        (context, index) {
                                      if (dailyGoods.isEmpty) {
                                        return const CircularProgressIndicator();
                                      } else {
                                        var product = dailyGoods[index];
                                        debugPrint(
                                            'ui层Item ID: ${product.id}, Item hotValue: ${product.hotValue}');
                                        // 进行相关操作
                                        return Container(
                                          padding: EdgeInsets.symmetric(vertical: 10.rpx),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text('${index + 4}',style: TextStyle(color: Colors.white),),
                                              SizedBox(width: 10.rpx,),
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(12), // 设置圆角半径
                                                child: Image.asset(
                                                  product.imageUrl!,
                                                  width: 55.rpx,
                                                  height: 55.rpx,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              SizedBox(width: 10.rpx,),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(product.name!,style: TextStyle(color: Colors.white,fontSize: 12.px),),
                                                  Container(width: 160.rpx,
                                                    child:
                                                    Text(product.description!,style: TextStyle(color: Colors.white,fontSize: 10.rpx),
                                                      maxLines: 1,overflow:TextOverflow.visible,),
                                                  )

                                                ],
                                              ),
                                              SizedBox(width: 10.rpx,),
                                              Image.asset(
                                                'lib/assert/热度.png',width: 20.rpx,height: 20.rpx,
                                              ),
                                              Text(product.hotValue.toString(),style: TextStyle(fontSize: 12.rpx,color: Colors.white),),

                                            ],
                                          ),
                                        );
                                      }
                                    },
                                    childCount: dailyGoods.length
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
                      )
                    ],
                  ),

                )
            )
          ],

        ),
      ),
    );
  }
}
