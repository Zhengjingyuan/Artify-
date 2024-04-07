import 'package:flutter/material.dart';

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
                        title: Text('交易记录',style: TextStyle(color: Colors.white),),
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
                                height: 160,
                                margin: EdgeInsets.symmetric(vertical: 8.0,horizontal: 8),
                                padding: EdgeInsets.all(12.0),
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
                                        Image.asset('lib/assert/source_3.png',width: 50,height: 50,),
                                        Column(
                                          children: [
                                            Text('寻龙记YO纪念邮戳',style: TextStyle(color: Colors.white,fontSize: 18),),
                                            Text('AC1638#cc3578/9999',style: TextStyle(color: Colors.grey,fontSize: 16),),

                                          ],
                                        ),
                                        SizedBox(width: 40,),
                                        Text('交易成功',style: TextStyle(color: Colors.green,fontSize: 18),)
                                      ],
                                    ),
                                    SizedBox(height: 5,),
                                    Opacity(
                                      opacity: 0.4,
                                      child: Divider(),
                                    ),
                                    SizedBox(height: 5,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('交易时间',style: TextStyle(color: Colors.grey,fontSize: 16),),
                                        Text('2024-02-03 17:22:55',style: TextStyle(color: Colors.white,fontSize: 16),),
                                      ],

                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('记录单号',style: TextStyle(color: Colors.grey,fontSize: 16),),
                                        Text('2023021734777834',style: TextStyle(color: Colors.white,fontSize: 16),),
                                      ],

                                    ),
                                  ],
                                ),
                              );

                            }
                            ,childCount:2
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
