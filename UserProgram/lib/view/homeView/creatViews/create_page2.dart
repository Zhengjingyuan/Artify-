import 'package:flutter/material.dart';
import 'package:userprogram/common/Routes.dart';
import 'package:userprogram/util/int_extention.dart';
import 'package:userprogram/util/size_fit.dart';
import 'package:userprogram/view/homeView/creatViews/create_original_page.dart';

class CreatePage2 extends StatefulWidget {


  @override
  _CreatePage2State createState() => _CreatePage2State();
}

class _CreatePage2State extends State<CreatePage2> {
  double containerHeight = 80.rpx;
  bool isExpanded = false;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    HYSizeFit.initialize();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final statusHeight = MediaQuery.of(context).padding.top;
    print("屏幕宽高: $width * $height");
    print("状态栏的高度: $statusHeight");
    print(HYSizeFit.screenWidth);

    void _toggleTextField() {
      setState(() {
        isExpanded = !isExpanded;
        containerHeight = isExpanded ? 210.rpx : 80.rpx;
      });
    }

    return Scaffold(
      resizeToAvoidBottomInset: false, // 解决键盘顶起页面
      backgroundColor: Colors.transparent,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Container(
            height: height,
            color: Colors.transparent,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 10.rpx,),
                    Text('AI创作',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.rpx),)
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    if (isExpanded) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      _toggleTextField();
                    }
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: containerHeight,
                    padding: EdgeInsets.all(16.rpx),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.rpx),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white.withOpacity(0.3),
                        border: Border.all(color: Colors.white.withOpacity(0.7)),
                      ),
                      padding: EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          if (isExpanded)
                            Positioned.fill(
                              child: GestureDetector(
                                onTap: () {
                                  _toggleTextField();
                                },
                              ),
                            ),
                          TextField(
                            style: TextStyle(color: Colors.white.withOpacity(0.7)),
                            decoration: InputDecoration(
                              hintText: '请对你所期望的NFT作品效果进行描述..',
                              hintStyle: TextStyle(color: Colors.white.withOpacity(0.5),fontSize: 14.rpx),
                              border: InputBorder.none, // 隐藏输入框默认边框
                              contentPadding: EdgeInsets.symmetric(horizontal: 6.rpx,vertical: 10.rpx), // 设置内边距
                            ),
                            maxLines: null,
                            onTap: () {
                              _toggleTextField();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: containerHeight == 80.rpx ? 210.rpx : 0,
                  child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(24.rpx, 24.rpx, 24.rpx, 10.rpx),
                          height: 100.rpx,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: Colors.white.withOpacity(0.1),
                              border: Border.all(color: Colors.white.withOpacity(0.1))
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.rpx), // 添加padding
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                    'lib/assert/icon_blub.png',
                                    width: 25.rpx,
                                    height: 25.rpx),
                                SizedBox(width: 10.rpx),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '一只黄色的长颈鹿',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      '坐在一张蓝色的椅子上',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 24.rpx),
                        child: Row(
                          children: [
                            Container(
                                height: 48.rpx,
                                width: 160.rpx,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.0),
                                    color: Colors.white.withOpacity(0.1),
                                    border: Border.all(color: Colors.white.withOpacity(0.1))
                                ),
                                child: Center(
                                  child: Text('🦒一只黄色的长颈鹿',style: TextStyle(color: Colors.white)),
                                )
                            ),
                            SizedBox(width: 16.rpx), // 添加间距
                            Container(
                                height: 48.rpx,
                                width: 48.rpx,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.0),
                                    color: Colors.white.withOpacity(0.1),
                                    border: Border.all(color: Colors.white.withOpacity(0.1))
                                ),
                                child: Center(
                                  child: Text('坐在',style: TextStyle(color: Colors.white)),
                                )
                            ),
                            SizedBox(width: 16.rpx), // 添加间距
                            Container(
                                height: 45.rpx,
                                width: 120.rpx,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.0),
                                    color: Colors.white.withOpacity(0.1),
                                    border: Border.all(color: Colors.white.withOpacity(0.1))
                                ),
                                child: Center(
                                  child: Text('💺蓝色的椅子',style: TextStyle(color: Colors.white)),
                                )
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                isExpanded
                    ? Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 24.rpx), // 设置右侧间距为20.0
                    child: ElevatedButton(
                      onPressed: () {
                        // 按钮点击事件
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0), // 设置按钮圆角为20.0
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(Colors.white.withOpacity(0.4)), // 修改按钮颜色
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 5.rpx, horizontal: 20.rpx)), // 设置按钮内边距
                      ),
                      child: Text('生成作品', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                )
                    : SizedBox(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 10.rpx,),
                    Text('创意案例',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.rpx),)
                  ],
                ),
                SizedBox(height: 10.rpx,),
                Container(
                  height: 280.rpx,
                  margin: EdgeInsets.symmetric(horizontal: 24.rpx),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white12,
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2), // 设置边框颜色为黑色
                      width: 1, // 设置边框宽度为2
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(4.rpx),
                        height: 195.rpx,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Image.asset(
                          'lib/assert/sample.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.rpx),
                        child: Row(

                          children: [
                            Container(
                                height: 25.rpx,
                                width: 110.rpx,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.0),
                                    color: Colors.white.withOpacity(0.1),
                                    border: Border.all(color: Colors.white.withOpacity(0.1))
                                ),
                                child: Center(
                                  child: Text('科幻小说',style: TextStyle(color: Colors.white)),
                                )
                            ),
                            SizedBox(width: 8.rpx), // 添加间距
                            Container(
                                height: 25.rpx,
                                width: 48.rpx,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.0),
                                    color: Colors.white.withOpacity(0.1),
                                    border: Border.all(color: Colors.white.withOpacity(0.1))
                                ),
                                child: Center(
                                  child: Text('夜晚',style: TextStyle(color: Colors.white)),
                                )
                            ),
                            SizedBox(width: 8.rpx), // 添加间距
                            Container(
                                height: 25.rpx,
                                width: 140.rpx,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.0),
                                    color: Colors.white.withOpacity(0.1),
                                    border: Border.all(color: Colors.white.withOpacity(0.1))
                                ),
                                child: Center(
                                  child: Text('背景有许多建筑',style: TextStyle(color: Colors.white)),
                                )
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.rpx,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.rpx),
                        child: Row(

                          children: [
                            Container(
                                height: 25.rpx,
                                width: 110.rpx,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.0),
                                    color: Colors.white.withOpacity(0.1),
                                    border: Border.all(color: Colors.white.withOpacity(0.1))
                                ),
                                child: Center(
                                  child: Text('上海外滩',style: TextStyle(color: Colors.white)),
                                )
                            ),
                            SizedBox(width: 8.rpx), // 添加间距
                            Container(
                                height: 25.rpx,
                                width: 56.rpx,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.0),
                                    color: Colors.white.withOpacity(0.1),
                                    border: Border.all(color: Colors.white.withOpacity(0.1))
                                ),
                                child: Center(
                                  child: Text('氖标志',style: TextStyle(color: Colors.white)),
                                )
                            ),
                            SizedBox(width: 8.rpx), // 添加间距
                            Container(
                                height: 25.rpx,
                                width: 120.rpx,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.0),
                                    color: Colors.white.withOpacity(0.1),
                                    border: Border.all(color: Colors.white.withOpacity(0.1))
                                ),
                                child: Center(
                                  child: Text('cyberpunk',style: TextStyle(color: Colors.white)),
                                )
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add, color: Colors.white),
                  iconSize: 30.rpx, // 设置图标大小
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateOringinalPage()),
                    );

                  },
                ),


              ],
            ),
          ),
        ),
      )
    );
  }

  Widget unExpandedTextFleid(){
    void expandTextField() {
      setState(() {
        isExpanded = true;
      });
    }
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.rpx),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white.withOpacity(0.3),
        border: Border.all(color: Colors.white.withOpacity(0.7)),
      ),
      child: TextField(
        style: TextStyle(color: Colors.white.withOpacity(0.7)),
        decoration: InputDecoration(
          hintText: '请对你所期望的NFT作品效果进行描述..',
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5),fontSize: 14.rpx),
          border: InputBorder.none, // 隐藏输入框默认边框
          contentPadding: EdgeInsets.symmetric(horizontal: 8.rpx), // 设置内边距
        ),
        onTap: () {
          expandTextField(); // 点击输入框时展开
        },
      ),

    );
  }

  Widget unExpandedBox(){
    return Container(
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(24.rpx, 24.rpx, 24.rpx, 10.rpx),
              height: 100.rpx,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  color: Colors.white.withOpacity(0.1),
                  border: Border.all(color: Colors.white.withOpacity(0.1))
              ),
              child: Padding(
                padding: EdgeInsets.all(16.rpx), // 添加padding
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                        'lib/assert/icon_blub.png',
                        width: 25.rpx,
                        height: 25.rpx),
                    SizedBox(width: 10.rpx),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '一只黄色的长颈鹿',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '坐在一张蓝色的椅子上',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              )
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24.rpx),
            child: Row(
              children: [
                Container(
                    height: 48.rpx,
                    width: 160.rpx,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: Colors.white.withOpacity(0.1),
                        border: Border.all(color: Colors.white.withOpacity(0.1))
                    ),
                    child: Center(
                      child: Text('🦒一只黄色的长颈鹿',style: TextStyle(color: Colors.white)),
                    )
                ),
                SizedBox(width: 16.rpx), // 添加间距
                Container(
                    height: 48.rpx,
                    width: 48.rpx,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: Colors.white.withOpacity(0.1),
                        border: Border.all(color: Colors.white.withOpacity(0.1))
                    ),
                    child: Center(
                      child: Text('坐在',style: TextStyle(color: Colors.white)),
                    )
                ),
                SizedBox(width: 16.rpx), // 添加间距
                Container(
                    height: 45.rpx,
                    width: 120.rpx,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: Colors.white.withOpacity(0.1),
                        border: Border.all(color: Colors.white.withOpacity(0.1))
                    ),
                    child: Center(
                      child: Text('💺蓝色的椅子',style: TextStyle(color: Colors.white)),
                    )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget ExpandedTextFleid(){
    return AnimatedContainer(
      height: 317.rpx,
      margin: EdgeInsets.symmetric(horizontal: 24.rpx),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white.withOpacity(0.3),
        border: Border.all(color: Colors.white.withOpacity(0.7)),
      ),
      duration: Duration(milliseconds: 300),
      child: TextField(
        style: TextStyle(color: Colors.white.withOpacity(0.7)),
        decoration: InputDecoration(
          hintText: '请对你所期望的NFT作品效果进行描述..',
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5),fontSize: 14.rpx),
          border: InputBorder.none, // 隐藏输入框默认边框
          contentPadding: EdgeInsets.symmetric(horizontal: 8.rpx), // 设置内边距
        ),
      ),
    );
  }
}
