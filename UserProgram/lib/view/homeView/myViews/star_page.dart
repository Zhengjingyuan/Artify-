import 'package:flutter/material.dart';
import 'package:userprogram/view/homeView/creatViews/create_detail_page.dart';
import 'package:userprogram/view/homeView/creatViews/create_page1.dart';

void main() {
  runApp(MaterialApp(
    home: StarPage(),
  ));
}

class StarPage extends StatefulWidget {

  @override
  State<StarPage> createState() => _StarPageState();
}

class _StarPageState extends State<StarPage> {
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
                        title: Text('我的收藏',style: TextStyle(color: Colors.white),),
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
                    SliverGrid(
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
                                  MaterialPageRoute(builder: (context) => CreateDetailPage(product),)
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(8.0),
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
                                  SizedBox(height: 16.0),
                                  Text(product.name!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                                  SizedBox(height: 8.0),
                                  Text(product.description!, style: TextStyle(fontSize: 14, color: Colors.white)),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Image.asset(
                                          'lib/assert/iconamoon_heart-thin.png'
                                      ),
                                      Text(product.likeNum.toString(),style: TextStyle(fontSize: 12,color: Colors.white),),

                                    ],
                                  )

                                ],
                              ),
                            ),
                          );
                        },
                        childCount: onChainGoodList.length,
                      ),

                    )

                  ],
                ) ),
          ],
        ),
      ),
    );
  }
}
