import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MaterialApp(
    home: RequirementPage(),
  ));
}

class RequirementPage extends StatefulWidget {
  const RequirementPage({super.key});

  @override
  State<RequirementPage> createState() => _RequirementPageState();
}

class _RequirementPageState extends State<RequirementPage> {
  bool firstSelected = false;

  File? _image;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          top:false,
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assert/bk.png'), // 替换成你想要设置的背景图片路径
                  fit: BoxFit.cover, // 适应容器大小，可以根据需求调整
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppBar(
                      centerTitle: true,
                      title: Text('发布需求',style: TextStyle(color: Colors.white),),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      leading: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);

                        },
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('藏品选择',style: TextStyle(color: Colors.white,fontSize: 18),)
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: getImage,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        height: 220,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.3),
                          border: Border.all(color: Colors.white.withOpacity(0.7)),
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: _image == null
                              ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add, size: 50, color: Colors.white),
                              Text('点击添加作品',style: TextStyle(color: Colors.grey,fontSize: 12),)
                            ],
                          )
                              : Image.file(_image!, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('类型选择',style: TextStyle(color: Colors.white,fontSize: 18),)
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              firstSelected = !firstSelected;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                            margin: EdgeInsets.symmetric(horizontal: 14),
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                            decoration: BoxDecoration(
                              color: firstSelected ? Color(0xFF4E3A74) : Colors.white24,
                              borderRadius: BorderRadius.all(Radius.circular(18)),
                              border: Border.all(color: Colors.white.withOpacity(0.6)),
                            ),
                            child: Center(
                              child: Text(
                                '互换',
                                style: TextStyle(color: Colors.white, fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8), // 间隔
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              firstSelected = !firstSelected;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                            decoration: BoxDecoration(
                                color: firstSelected ? Colors.white12 : Color(0xFF4E3A74),
                                borderRadius: BorderRadius.all(Radius.circular(18)),
                                border: Border.all(color: Colors.white.withOpacity(0.6))
                            ),
                            child: Center(
                              child: Text(
                                '转赠',
                                style: TextStyle(color: Colors.white, fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),


                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('需求描述',style: TextStyle(color: Colors.white,fontSize: 18),)
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white.withOpacity(0.3),
                        border: Border.all(color: Colors.white.withOpacity(0.7)),
                      ),
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(color: Colors.white.withOpacity(0.7)),
                        decoration: InputDecoration(
                          hintText: '请在此输入你的交易需求',
                          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5),fontSize: 14),
                          border: InputBorder.none, // 隐藏输入框默认边框
                          contentPadding: EdgeInsets.symmetric(horizontal: 6,vertical: 10), // 设置内边距
                        ),
                        maxLines: 1,

                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('联系方式',style: TextStyle(color: Colors.white,fontSize: 18),)
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white.withOpacity(0.3),
                        border: Border.all(color: Colors.white.withOpacity(0.7)),
                      ),
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(color: Colors.white.withOpacity(0.7)),
                        decoration: InputDecoration(
                          hintText: '在此输入你的联系方式',
                          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5),fontSize: 14),
                          border: InputBorder.none, // 隐藏输入框默认边框
                          contentPadding: EdgeInsets.symmetric(horizontal: 6,vertical: 10), // 设置内边距
                        ),
                        maxLines: 1,

                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // 按钮点击事件处理
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF5E1B88)), // 设置按钮背景颜色
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0), // 设置圆角大小
                                ),
                              ),
                              side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(color: Color(0xFFA256A9)), // 设置边框颜色
                              ),
                            ),
                            child: Text(
                              '发布需求',
                              style: TextStyle(color: Colors.white,fontSize: 12), // 设置字体颜色为白色
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),

          ),
        )
    );
  }
}
