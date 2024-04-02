import 'package:flutter/material.dart';
import 'package:userprogram/model/home_good/onchain_bean.dart';


class CreateDetailPage extends StatefulWidget {
  final OnChainGood product;
  CreateDetailPage(this.product);

  @override
  _CreateDetailPageState createState() => _CreateDetailPageState();
}

class _CreateDetailPageState extends State<CreateDetailPage> {

  bool isLiked = false;
  bool isFavorite = false;

  late OnChainGood _product;
  @override
  void initState() {
    _product = widget.product;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _product.name!,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(

                      children: [
                        Container(
                            height: 56,
                            width: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                color: Color(0xFF3D3757).withOpacity(0.6),
                                border: Border.all(color: Colors.white.withOpacity(0.5))
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment:MainAxisAlignment.center,
                                children: [
                                  Image.asset('lib/assert/certificate.png', color: Colors.white,width: 20,height: 20,),
                                  Text('区块链证书',style: TextStyle(color: Colors.white,fontSize: 12)),
                                ],
                              ),
                            )
                        ),
                        SizedBox(width: 8), // 添加间距
                        Container(
                            height: 56,
                            width: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                color: Color(0xFF3D3757).withOpacity(0.6),
                                border: Border.all(color: Colors.white.withOpacity(0.5))
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment:MainAxisAlignment.center,
                                children: [
                                  Image.asset('lib/assert/profile_icon.png', color: Colors.white,width: 20,height: 20,),
                                  Text('生成头像',style: TextStyle(color: Colors.white,fontSize: 12)),
                                ],
                              ),
                            )
                        ),
                        SizedBox(width: 8), // 添加间距
                        Container(
                            height: 56,
                            width: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                color: Color(0xFF3D3757).withOpacity(0.6),
                                border: Border.all(color: Colors.white.withOpacity(0.5))
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment:MainAxisAlignment.center,
                                children: [
                                  Image.asset('lib/assert/illustrated.png', color: Colors.white,width: 20,height: 20,),
                                  Text('图鉴查看',style: TextStyle(color: Colors.white,fontSize: 12)),
                                ],
                              ),
                            )
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('作者简介',style: TextStyle(color: Colors.white,fontSize: 18),)
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color:Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '    杰克·汉密尔顿（Jack Hamilton）,现代艺术家，生于一个小渔村，从小就被大海的壮阔和神秘所吸引。他的作品以其独特的风格和深刻的内涵而闻名于世，常常被赞誉为将自然之美完美呈现在画布上的大师。',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('创作故事',style: TextStyle(color: Colors.white,fontSize: 18),)
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color:Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '杰克·汉密尔顿从小就对大海充满热爱与向往。他常常独自来到海边，凝视着那一波波汹涌的浪花，思考着人生的起伏与变化。《Wave》便是他对大海无尽力量的致敬之作，也是他内心世界的一次完美呈现。',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),

                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child:Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    border: Border.all(color: Colors.white.withOpacity(0.7), width: 1),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding: EdgeInsets.all(10),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isLiked = !isLiked; // 点击后切换点赞状态
                            });
                          },
                          icon: Icon(
                            isLiked ? Icons.favorite : Icons.favorite_border, // 根据点赞状态显示不同图标
                            color: isLiked ? Colors.red : Colors.white, // 根据点赞状态设置颜色
                          ),
                        ),
                        Text('50',style: TextStyle(color: Colors.white),),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isFavorite = !isFavorite; // 点击后切换收藏状态
                            });
                          },
                          icon: Icon(
                            isFavorite ? Icons.star : Icons.star_border, // 根据收藏状态显示不同图标
                            color: isFavorite ? Colors.greenAccent : Colors.white, // 根据收藏状态设置颜色
                          ),
                        ),
                        Text('50',style: TextStyle(color: Colors.white),),
                        IconButton(
                          onPressed: () {
                            // 点击评论逻辑处理
                          },
                          icon: Icon(Icons.comment), // 评论图标，可根据具体需要替换
                        ),
                        Text('50',style: TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                )
              ),
            ],
          ),
        )
    );
  }
}
