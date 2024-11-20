import 'package:flutter/material.dart';
import 'package:userprogram/model/home_good/onchain_bean.dart';
import 'package:userprogram/util/int_extention.dart';
import 'package:userprogram/util/size_fit.dart';
import 'package:userprogram/view/homeView/myViews/make_card_page.dart';

/**
 * 我的藏品的详情页面
 */


class CollectionDetailPage extends StatefulWidget {
  final OnChainGood product;
  CollectionDetailPage(this.product);

  @override
  _CollectionDetailPageState createState() => _CollectionDetailPageState();
}

class _CollectionDetailPageState extends State<CollectionDetailPage> {

  late OnChainGood _product;
  @override
  void initState() {
    _product = widget.product;
    super.initState();
  }

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
          child: Stack(
            children: [
              Image.asset(
                'lib/assert/bk.png',
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),

              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  _product.imageUrl!,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
              ),

              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AppBar(
                  centerTitle: true,
                  title: Text('藏品详情',style: TextStyle(color: Colors.white),),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.35,
                left: 16.rpx,
                right: 16.rpx,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _product.name!,
                      style: TextStyle(
                        fontSize: 28.rpx,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.rpx, vertical: 4.rpx),
                      decoration: BoxDecoration(
                        color: Color(0xFF4E3A74).withOpacity(0.6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        _product.type == 0
                            ? '官方发售'
                            : _product.type == 1
                            ? '个人原创'
                            : _product.type == 2
                            ? 'AI 创作'
                            : '',
                        style: TextStyle(color: Colors.white, fontSize: 12.rpx),
                      ),
                    ),
                    SizedBox(height: 20.rpx),
                    Row(

                      children: [
                        Container(
                            height: 56.rpx,
                            width: 90.rpx,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                color: Color(0xFF3D3757).withOpacity(0.6),
                                border: Border.all(color: Colors.white.withOpacity(0.5))
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment:MainAxisAlignment.center,
                                children: [
                                  Image.asset('lib/assert/certificate.png', color: Colors.white,width: 20.rpx,height: 20.rpx,),
                                  Text('区块链证书',style: TextStyle(color: Colors.white,fontSize: 12.px)),
                                ],
                              ),
                            )
                        ),
                        SizedBox(width: 8.rpx), // 添加间距
                        Container(
                            height: 56.rpx,
                            width: 90.rpx,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                color: Color(0xFF3D3757).withOpacity(0.6),
                                border: Border.all(color: Colors.white.withOpacity(0.5))
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment:MainAxisAlignment.center,
                                children: [
                                  Image.asset('lib/assert/profile_icon.png', color: Colors.white,width: 20.rpx,height: 20.rpx,),
                                  Text('生成头像',style: TextStyle(color: Colors.white,fontSize: 12.rpx)),
                                ],
                              ),
                            )
                        ),
                        SizedBox(width: 8.rpx), // 添加间距
                        Container(
                            height: 56.rpx,
                            width: 90.rpx,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                color: Color(0xFF3D3757).withOpacity(0.6),
                                border: Border.all(color: Colors.white.withOpacity(0.5))
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment:MainAxisAlignment.center,
                                children: [
                                  Image.asset('lib/assert/illustrated.png', color: Colors.white,width: 20.rpx,height: 20.rpx,),
                                  Text('图鉴查看',style: TextStyle(color: Colors.white,fontSize: 12.rpx)),
                                ],
                              ),
                            )
                        ),
                      ],
                    ),
                    SizedBox(height: 10.rpx,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('藏品简介',style: TextStyle(color: Colors.white,fontSize: 18.rpx),)
                      ],
                    ),
                    SizedBox(height: 10.rpx,),
                    SingleChildScrollView(
                      child: Container(
                        width:MediaQuery.of(context).size.width,
                        height: 400.rpx,
                        margin: EdgeInsets.symmetric(horizontal: 20.rpx),
                        padding: EdgeInsets.symmetric(vertical: 10.rpx, horizontal: 20.rpx),
                        decoration: BoxDecoration(
                          color: Color(0xFF190D2A),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF172C49),
                              spreadRadius: 2,
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Text(
                          _product.description!,
                          style: TextStyle(color: Colors.white, fontSize: 15.rpx),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child:Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.all(
                            Radius.circular(24)
                        ),
                        border: Border.all(color: Colors.white.withOpacity(0.7),width: 1)
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 20.rpx, vertical: 10.rpx),
                    padding: EdgeInsets.all(10.rpx),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.rpx),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MakeCardPage(_product),)
                              );
                            },
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(Size(0, 0)), // 设置按钮大小为0，避免默认最小大小
                            ),
                            child: Text(
                              '制作实体卡片',
                              style: TextStyle(fontSize: 16.rpx, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    )
                ),
              ),
            ],
          ),
        )
    );
  }
}
