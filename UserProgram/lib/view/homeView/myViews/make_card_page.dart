import 'package:flutter/material.dart';
import 'package:userprogram/model/home_good/onchain_bean.dart';
import 'package:userprogram/util/int_extention.dart';
import 'package:userprogram/util/size_fit.dart';

class MakeCardPage extends StatefulWidget {
  final OnChainGood product;
  MakeCardPage(this.product);

  @override
  _MakeCardPageState createState() => _MakeCardPageState();


}

class _MakeCardPageState extends State<MakeCardPage>{

  FocusNode _focusNode = FocusNode();
  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }


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
      body:Container(
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
              title: Text('实体卡片制作',style: TextStyle(color: Colors.white),),
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              actions: [
                Image.asset('lib/assert/编辑 1.png')
              ],
            ),
            Expanded(
                child:CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        padding: EdgeInsets.symmetric(horizontal: 8.rpx),
                        child: Center(
                          child: Container(
                              width: 235.rpx,
                              height: 380.rpx,
                              padding: EdgeInsets.all(8.rpx),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                image: DecorationImage(
                                  image: AssetImage('lib/assert/card_bk.png',), // 替换成你想要设置的背景图片路径
                                  fit: BoxFit.fill, // 适应容器大小，可以根据需求调整
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF172C49),
                                    spreadRadius: 5,
                                    blurRadius: 6,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(_product.imageUrl!,height: 220.rpx,width:220.rpx,fit: BoxFit.contain),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10.rpx),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _product.name!,
                                          style: TextStyle(
                                            fontSize: 28.rpx,
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
                                            '个人原创',
                                            style: TextStyle(color: Colors.white, fontSize: 12.rpx),
                                          ),
                                        ),
                                        Text(
                                          '克里斯汀·奥赛（Kristin Odyssey）',
                                          style: TextStyle(
                                            fontSize: 12.rpx,
                                            color: Colors.white.withOpacity(0.8),
                                          ),
                                        ),
                                      ],
                                    ),

                                  ),
                                  SizedBox(height: 8.rpx,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Image.asset('lib/assert/cangjinglogo.png',width: 42.rpx,height: 42.rpx,),
                                      Text(
                                        '藏境',
                                        style: TextStyle(
                                          fontSize: 14.rpx,
                                          color: Colors.white,
                                        ),
                                      ),


                                    ],
                                  )

                                ],
                              )
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 20.rpx,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        height: 400.rpx,
                        color: Color(0xFF15132D),
                        child: Column(
                          children: [
                            SizedBox(height: 10.rpx,),
                            Text('信息填写',style: TextStyle(color: Colors.white,fontSize: 20.rpx),),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width: 28),
                                Text('收件人姓名',style: TextStyle(color: Colors.white,fontSize: 14.rpx),),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 24.rpx,vertical: 8.rpx),
                              decoration: BoxDecoration(
                                  color: Colors.transparent, // 设置背景色为半透明灰色
                                  borderRadius: BorderRadius.circular(32), // 设置圆角边框
                                  border: Border.all(color: Colors.white24,width: 2)
                              ),
                              child: TextField(
                                keyboardType: TextInputType.text,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.7),fontSize: 14.rpx),
                                  border: InputBorder.none, // 去除默认边框
                                  contentPadding: EdgeInsets.symmetric(horizontal: 18.rpx), // 设置内容内边距

                                ),
                              ),
                            ),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width: 28.rpx),
                                Text('联系电话',style: TextStyle(color: Colors.white,fontSize: 14.rpx),),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 24.rpx,vertical: 8.rpx),
                              decoration: BoxDecoration(
                                  color: Colors.transparent, // 设置背景色为半透明灰色
                                  borderRadius: BorderRadius.circular(32), // 设置圆角边框
                                  border: Border.all(color: Colors.white24,width: 2)
                              ),
                              child: TextField(
                                keyboardType: TextInputType.text,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.7),fontSize: 14.rpx),
                                  border: InputBorder.none, // 去除默认边框
                                  contentPadding: EdgeInsets.symmetric(horizontal: 18.rpx), // 设置内容内边距

                                ),
                              ),
                            ),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width: 28.rpx),
                                Text('收件人地址',style: TextStyle(color: Colors.white,fontSize: 14.rpx),),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 24.rpx,vertical: 8.rpx),
                              decoration: BoxDecoration(
                                  color: Colors.transparent, // 设置背景色为半透明灰色
                                  borderRadius: BorderRadius.circular(32), // 设置圆角边框
                                  border: Border.all(color: Colors.white24,width: 2)
                              ),
                              child: TextField(
                                keyboardType: TextInputType.text,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.7),fontSize: 14.rpx),
                                  border: InputBorder.none, // 去除默认边框
                                  contentPadding: EdgeInsets.symmetric(horizontal: 18.rpx), // 设置内容内边距

                                ),
                              ),
                            ),

                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(32)
                                    ),
                                    border: Border.all(color: Colors.white.withOpacity(0.7),width: 1)
                                ),
                                margin: EdgeInsets.symmetric(horizontal: 22.rpx, vertical: 12.rpx),
                                padding: EdgeInsets.all(10.rpx),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.rpx),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Dialog(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(16.0),
                                                ),
                                                child: Container(
                                                  height: 130,
                                                  width: 245,
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

                                                      SizedBox(height: 8.0),
                                                      Text("信息提交成功！",style: TextStyle(color: Colors.white,fontSize: 14),),
                                                      Text("卡片很快就会开始制作啦",style: TextStyle(color: Colors.white,fontSize: 14),),
                                                      SizedBox(height: 16.0),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        style: ButtonStyle(
                                          minimumSize: MaterialStateProperty.all(Size(0, 0)), // 设置按钮大小为0，避免默认最小大小
                                        ),
                                        child: Text(
                                          '制作实体卡片',
                                          style: TextStyle(fontSize: 16, color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                    )

                  ],
                )
            )
          ],
        ),
      ),
      );
  }
}