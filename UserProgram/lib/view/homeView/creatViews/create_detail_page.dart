

import 'package:flutter/material.dart';
import 'package:userprogram/model/home_good/onchain_bean.dart';
import 'package:userprogram/util/int_extention.dart';
import 'package:userprogram/util/size_fit.dart';


class CreateDetailPage extends StatefulWidget {
  final OnChainGood product;
  CreateDetailPage(this.product);

  @override
  _CreateDetailPageState createState() => _CreateDetailPageState();
}

class _CreateDetailPageState extends State<CreateDetailPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _likeAnimation;
  late Animation<double> _starAnimation;

  bool isLiked = false;
  bool isFavorite = false;
  int like=243;
  int star=89;

  late OnChainGood _product;
  @override
  void initState() {
    _product = widget.product;
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _likeAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller);
    _starAnimation =Tween<double>(begin: 1.0, end: 1.5).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                  title: Text('Collection Details',style: TextStyle(color: Colors.white),),
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
                              ? 'Official'
                              : _product.type == 1
                              ? 'Original'
                              : _product.type == 2
                              ? 'AI'
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
                                  Text('Blockchain',style: TextStyle(color: Colors.white,fontSize: 12.rpx)),
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
                                  Text('Avatar',style: TextStyle(color: Colors.white,fontSize: 12.rpx)),
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
                                  Text('Catalog',style: TextStyle(color: Colors.white,fontSize: 12.rpx)),
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
                        Text('About Author',style: TextStyle(color: Colors.white,fontSize: 18.rpx),)
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10.rpx, horizontal: 20.rpx),
                      decoration: BoxDecoration(
                        color:Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '    I am Chi Lushan, a free soul who loves art. For me, art is a way of life and a means for me to express my inner emotions and thoughts. I enjoy exploring, creating, and sharing my creativity and ideas through various art forms.',
                        style: TextStyle(color: Colors.white, fontSize: 15.rpx),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Creating Story',style: TextStyle(color: Colors.white,fontSize: 18.rpx),)
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10.rpx, horizontal: 20.rpx),
                      decoration: BoxDecoration(
                        color:Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '    Su embroidery carries the tenderness and elegance of the water towns in Jiangnan. In the interweaving of needles and threads, the waves roll, the mountains and rivers are magnificent, and vivid paintings bloom in Su embroidery. With a thousand year old craftsmanship, it depicts the mountains and rivers, showcasing the charm of Jiangnan. Every stitch and thread showcases the unique craftsmanship.',
                        style: TextStyle(color: Colors.white, fontSize: 15.rpx),
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
                    border: Border.all(color: Colors.white.withOpacity(0.7), width: 1.rpx),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20.rpx, vertical: 10.rpx),
                  padding: EdgeInsets.all(10.rpx),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.rpx),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AnimatedBuilder(
                            animation: _controller,
                            builder:(context,child){
                              return IconButton(
                                onPressed: () {
                                  setState(() {
                                    isLiked = !isLiked;
                                    if(isLiked){
                                      like++;
                                      _controller.forward();
                                    }else{
                                      like--;
                                      _controller.reverse();
                                    }
                                  });
                                },
                                icon: Icon(
                                  isLiked ? Icons.favorite : Icons.favorite_border, // 根据点赞状态显示不同图标
                                  color: isLiked ? Colors.red : Colors.white, //
                                  size: _likeAnimation.value * 20.rpx,
                                ),
                              );
                        }
                        ),
                        Text(like.toString(),style: TextStyle(color: Colors.white),),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isFavorite = !isFavorite; // 点击后切换收藏状态
                              if(isFavorite){
                                star++;
                                _controller.forward();
                              }else{
                                star--;
                                _controller.reverse();
                              }

                            });
                          },
                          icon: Icon(
                            isFavorite ? Icons.star : Icons.star_border, // 根据收藏状态显示不同图标
                            color: isFavorite ? Colors.greenAccent : Colors.white, // 根据收藏状态设置颜色
                            size: _likeAnimation.value * 20.rpx,
                          ),
                        ),
                        Text(star.toString(),style: TextStyle(color: Colors.white),),
                        IconButton(
                          onPressed: () {
                            // 点击评论逻辑处理
                          },
                          icon: Icon(Icons.comment), // 评论图标，可根据具体需要替换
                        ),
                        Text('50',style: TextStyle(color: Colors.white),),
                        SizedBox(
                          width: 30.rpx,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 14.rpx,vertical: 8.rpx),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(36),
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            '发布评论',
                            style: TextStyle(
                              fontSize: 12.rpx,
                              color: Colors.white
                            ),
                          ),
                  )
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
