import 'package:flutter/material.dart';
import 'package:userprogram/model/home_good/onchain_bean.dart';
import 'package:userprogram/util/int_extention.dart';
import 'package:userprogram/util/size_fit.dart';
import 'package:userprogram/view/homeView/transactionViews/requirement_page.dart';
import 'package:userprogram/view/homeView/transactionViews/transaction_detail_page.dart';
/**
 * 流转中心页
 */

class TransactionPage extends StatefulWidget {
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {

  List<OnChainGood> onChainGoodList = [
    OnChainGood(
      blockchainAddress: "blockchainAddress1",
      category: "category1",
      commentsNum: 10,
      createdAt: "2022-01-01",
      creator: 1,
      description: "Rare Collection",
      hotValue: 100,
      id: 1,
      imageUrl: "lib/assert/3d.png",
      isOnChain: true,
      likeNum: 20,
      name: "courtyard",
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
      description: "seek same product",
      hotValue: 50,
      id: 2,
      imageUrl: "lib/assert/source_7.png",
      isOnChain: false,
      likeNum: 10,
      name: "porcelain",
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
      description: "Collect same series",
      hotValue: 100,
      id: 1,
      imageUrl: "lib/assert/source_2.png",
      isOnChain: true,
      likeNum: 20,
      name: "Miao Xia",
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
      description: "exchanged for any",
      hotValue: 100,
      id: 1,
      imageUrl: "lib/assert/rose.jpg",
      isOnChain: true,
      likeNum: 20,
      name: "frozen roses",
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
      description: "用爆品一换多个藏品",
      hotValue: 100,
      id: 1,
      imageUrl: "lib/assert/liujin.png",
      isOnChain: true,
      likeNum: 20,
      name: "爆品交换",
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
      description: "收集同系列",
      hotValue: 50,
      id: 2,
      imageUrl: "lib/assert/yinhe.png",
      isOnChain: false,
      likeNum: 10,
      name: "李白诗系列",
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
      description: "可任意提起交换",
      hotValue: 100,
      id: 1,
      imageUrl: "lib/assert/source_4.png",
      isOnChain: true,
      likeNum: 20,
      name: "Mid 霓虹娃娃",
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
      description: "可以带条件来",
      hotValue: 100,
      id: 1,
      imageUrl: "lib/assert/source_5.png",
      isOnChain: true,
      likeNum: 20,
      name: "收数字山川",
      onChainTime: "2022-01-02",
      owner: 1,
      price: 10.5,
      quantity: 1,
      type: 1,
      updatedAt: "2022-01-03",
    ),
    // 继续添加其他实例...
  ];

  @override
  Widget build(BuildContext context) {
    HYSizeFit.initialize();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/assert/bk.png'), // 替换成你想要设置的背景图片路径
          fit: BoxFit.cover, // 适应容器大小，可以根据需求调整
        ),
      ),
      child: Column(
        children: [
          AppBar(
            centerTitle: true,
            title: Text('Circulation Center',style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.rpx,vertical: 16.rpx),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Collection',style: TextStyle(color: Colors.white,fontSize: 24.rpx),),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RequirementPage(),));
                  },
                  child: Text('Requirement Release >',style: TextStyle(color: Colors.white,fontSize: 16.rpx),),
                )
              ],
            ),
          ),
          Expanded(
              child:CustomScrollView(
                slivers: [
              SliverPadding(
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
                            MaterialPageRoute(builder: (context) => TransactionDetailPage(product),)
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.rpx),
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
                            Text(product.name!, style: TextStyle(fontSize: 18.rpx, fontWeight: FontWeight.bold, color: Colors.white)),
                            SizedBox(height: 8.rpx),
                            Text(product.description!, style: TextStyle(fontSize: 14, color: Colors.white)),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 18.rpx, vertical: 6.rpx),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF4E3A74).withOpacity(0.6),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text('swap',
                                    style: TextStyle(color: Colors.white, fontSize: 12.rpx),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    );
                  },
                  childCount: onChainGoodList.length,
                ),

              )
          ),
                ],
              )
          )

        ],
      ),
    );
  }
}
