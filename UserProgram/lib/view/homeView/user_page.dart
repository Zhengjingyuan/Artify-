import 'package:flutter/material.dart';
import 'package:userprogram/model/home_good/onchain_bean.dart';
import 'package:userprogram/view/homeView/myViews/mycollection_detail_page.dart';
import 'package:userprogram/view/homeView/transactionViews/requirement_page.dart';


class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  _UserPageState createState() => _UserPageState();
}


class _UserPageState extends State<UserPage> {

  List<OnChainGood> onChainGoodList = [
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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/assert/bk.png'), // 替换成你想要设置的背景图片路径
          fit: BoxFit.cover, // 适应容器大小，可以根据需求调整
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Welcome , soroushnrz',style: TextStyle(color: Color(0xFFD9AAFF),fontSize: 14,fontWeight: FontWeight.bold),),
              ClipOval(
                child: Image.asset(
                  'lib/assert/profile.png',
                  width: 60,
                  height: 60,
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Container(
            height: 80,
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(16),
            ),
            child:Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star,color: Colors.white.withOpacity(0.7),),
                      Text('收藏',style: TextStyle(color: Colors.white))
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.comment,color: Colors.white.withOpacity(0.7),),
                      Text('评论',style: TextStyle(color: Colors.white),)
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.account_balance_wallet_outlined,color: Colors.white.withOpacity(0.7),),
                      Text('订单',style: TextStyle(color: Colors.white))
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.settings,color: Colors.white.withOpacity(0.7),),
                      Text('设置',style: TextStyle(color: Colors.white))
                    ],
                  ),
                ],
              ),
            )
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 30,),
              Text('我的藏品',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 1,
            color: Colors.white12,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child:CustomScrollView(
                slivers: [
                  SliverPadding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      sliver: SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16.0,
                            mainAxisSpacing: 16.0,
                            childAspectRatio: 0.75, // 控制宽高比例，根据实际情况调整
                            mainAxisExtent: 210
                        ),
                        delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                var product = onChainGoodList[index];
                            return GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => CollectionDetailPage(product),)
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFFEBEBF5).withOpacity(0.2)),
                                  color: Colors.purple.withOpacity(0.2),
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
                                    SizedBox(height: 14.0),
                                    Text(product.name!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),


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
          ),


        ],
      ),
    );
  }
}
