import 'package:flutter/material.dart';
import 'package:userprogram/util/int_extention.dart';
import 'package:userprogram/util/size_fit.dart';

void main() {
  runApp(MaterialApp(
    home: RecordTran(),
  ));
}

class RecordTran extends StatefulWidget {

  @override
  State<RecordTran> createState() => _RecordTranState();
}

class _RecordTranState extends State<RecordTran> {
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
            Expanded(
                child:CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: AppBar(
                        centerTitle: true,
                        title: Text('Transaction Record',style: TextStyle(color: Colors.white),),
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        leading: IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);

                          },
                        ),
                      ),
                    ),
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                            (context,index){
                              return Container(
                                height: 165.rpx,
                                margin: EdgeInsets.symmetric(vertical: 8.rpx,horizontal: 8.rpx),
                                padding: EdgeInsets.all(14.rpx),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xFFEBEBF5).withOpacity(0.2)), // 白色边框
                                  color: Colors.white.withOpacity(0.1), // 透明背景
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child:Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Image.asset('lib/assert/source_3.png',width: 50.rpx,height: 50.rpx,),
                                        Column(
                                          children: [
                                            Text('Dragon Quest YO ',style: TextStyle(color: Colors.white,fontSize: 18.rpx),),
                                            Text('AC1638#cc3578/9999',style: TextStyle(color: Colors.grey,fontSize: 16.rpx),),

                                          ],
                                        ),
                                        SizedBox(width: 40.rpx,),
                                        Text('done',style: TextStyle(color: Colors.green,fontSize: 18.rpx),)
                                      ],
                                    ),
                                    SizedBox(height: 5.rpx,),
                                    Opacity(
                                      opacity: 0.4,
                                      child: Divider(),
                                    ),
                                    SizedBox(height: 5,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('time',style: TextStyle(color: Colors.grey,fontSize: 16.rpx),),
                                        Text('2024-02-03 17:22:55',style: TextStyle(color: Colors.white,fontSize: 16.rpx),),
                                      ],

                                    ),
                                    SizedBox(height: 10.rpx,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('number',style: TextStyle(color: Colors.grey,fontSize: 16.rpx),),
                                        Text('2023021734777834',style: TextStyle(color: Colors.white,fontSize: 16.rpx),),
                                      ],

                                    ),
                                  ],
                                ),
                              );

                            }
                            ,childCount:1
                        )
                    )
                  ],
                ) ),
          ],
        ),
      ),
    );
  }
}
