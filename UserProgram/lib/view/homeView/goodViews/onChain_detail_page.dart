import 'package:flutter/material.dart';
import 'package:userprogram/model/home_good/onchain_bean.dart';
import 'package:userprogram/util/int_extention.dart';
import 'package:userprogram/util/size_fit.dart';

/**
 * 链上藏品的详情页面
 */

class OnChainDetailPage extends StatefulWidget {
  final OnChainGood product;
  OnChainDetailPage(this.product);

  @override
  _OnChainDetailPageState createState() => _OnChainDetailPageState();
}

class _OnChainDetailPageState extends State<OnChainDetailPage> {

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
                          ? 'Official release'
                          : _product.type == 1
                          ? 'Personal creation'
                          : _product.type == 2
                          ? 'AI creation'
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
                                Text('Certificate',style: TextStyle(color: Colors.white,fontSize: 12.rpx)),
                              ],
                            ),
                          )
                      ),
                      SizedBox(width: 8), // 添加间距
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
                                Image.asset('lib/assert/profile_icon.png', color: Colors.white,width: 20,height: 20,),
                                Text('Avatar',style: TextStyle(color: Colors.white,fontSize: 12)),
                              ],
                            ),
                          )
                      ),
                      SizedBox(width: 8), // 添加间距
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
                                Text('View catalog',style: TextStyle(color: Colors.white,fontSize: 12.rpx)),
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
                      Text('Collection Introduction',style: TextStyle(color: Colors.white,fontSize: 18.rpx),)
                    ],
                  ),
                  SizedBox(height: 10.rpx,),
                  SingleChildScrollView(
                    child: Container(
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
                    color: Colors.black.withOpacity(0.6),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '￥${_product.price.toString()}',
                        style: TextStyle(color:Colors.white,fontSize: 16.rpx, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                height: 240.rpx,
                                decoration: BoxDecoration(
                                  color: Color(0xFF201537),
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                          Container(
                                          padding: EdgeInsets.symmetric(vertical: 4.rpx,horizontal: 12.rpx),
                                          margin: EdgeInsets.all(16.rpx),
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(0.4),
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(color: Colors.white, width: 1),
                                          ),
                                          child: Text(
                                            '1 portion',
                                            style: TextStyle(fontSize: 20.rpx),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20.rpx),
                                    Text('￥${_product.price.toString()}', style: TextStyle(color: Colors.white, fontSize: 24.rpx),),
                                    OutlinedButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Dialog(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(16.0),
                                              ),
                                              child: Container(
                                                height: 130.rpx,
                                                width: 245.rpx,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF3F3D53),
                                                  borderRadius: BorderRadius.circular(16.0),
                                                ),
                                                padding: EdgeInsets.all(16.0),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [

                                                    SizedBox(height: 8.rpx),
                                                    Text("Purchase successful！",style: TextStyle(color: Colors.white,fontSize: 14.rpx),),
                                                    SizedBox(height: 16.rpx),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      style: OutlinedButton.styleFrom(
                                        side: BorderSide(color: Colors.white),
                                        backgroundColor: Colors.black,
                                      ),
                                      child: Text(
                                        'purchase now',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.rpx,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(0, 0)), // 设置按钮大小为0，避免默认最小大小
                        ),
                        child: Text(
                          'PURCHASE',
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
