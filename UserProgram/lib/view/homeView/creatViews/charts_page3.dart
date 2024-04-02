import 'package:flutter/material.dart';
import 'package:userprogram/base/components/charts.dart';

void main() {
  runApp(MaterialApp(
    home: ChartsPage3(),
  ));
}

class ChartsPage3 extends StatefulWidget {
  const ChartsPage3({super.key});

  @override
  State<ChartsPage3> createState() => _ChartsPage3State();
}

class _ChartsPage3State extends State<ChartsPage3> {
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
            AppBar(
              title: Text('月榜',style: TextStyle(color: Color(0xFFD9AAFF),fontSize: 48,fontWeight: FontWeight.bold),),
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
              height: 10,
            ),
            AnimatedCarouselCard(cardList: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0), // 设置圆角半径为16.0
                child: Image.asset(
                  'lib/assert/art.png',
                  fit: BoxFit.cover,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0), // 设置圆角半径为16.0
                child: Image.asset(
                  'lib/assert/music.png',
                  fit: BoxFit.cover,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0), // 设置圆角半径为16.0
                child: Image.asset(
                  'lib/assert/virtual.png',
                  fit: BoxFit.cover,
                ),
              ),
            ]),
            SizedBox(height: 30,),
            Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    color: Colors.white.withOpacity(0.1),
                  ),
                  child: CustomScrollView(
                    slivers: [
                      SliverList(
                          delegate: SliverChildBuilderDelegate(((context,index){
                            return Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 10,),
                                  Text('${index + 1}',style: TextStyle(color: Colors.white),),
                                  SizedBox(width: 16,),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12), // 设置圆角半径
                                    child: Image.asset(
                                      'lib/assert/img_4.png',
                                      width: 60,
                                      height: 60,
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Column(
                                    children: [
                                      Text('Azumi',style: TextStyle(color: Colors.white,fontSize: 12),),
                                      Text('view info',style: TextStyle(color: Colors.white,fontSize: 10),),

                                    ],
                                  ),
                                  SizedBox(width: 140,),
                                  Image.asset(
                                      'lib/assert/iconamoon_heart-thin.png'
                                  ),
                                  Text('22',style: TextStyle(fontSize: 12,color: Colors.white),),

                                ],
                              ),
                            );

                          })

                          )
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
