import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:userprogram/common/Routes.dart';

void main() {
  runApp(MaterialApp(
    home: CreateOringinalPage(),
  ));
}

class CreateOringinalPage extends StatefulWidget {
  const CreateOringinalPage({super.key});

  @override
  _CreateOringinalPageState createState() => _CreateOringinalPageState();
}

class _CreateOringinalPageState extends State<CreateOringinalPage> {

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
            child: Column(
              children: [
                AppBar(
                  centerTitle: true,
                  title: Text('发布作品',style: TextStyle(color: Colors.white),),
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
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('作品预览',style: TextStyle(color: Colors.white,fontSize: 18),)
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: getImage,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    height: 240,
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
                      Text('作品标题',style: TextStyle(color: Colors.white,fontSize: 18),)
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white.withOpacity(0.3),
                    border: Border.all(color: Colors.white.withOpacity(0.7)),
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    style: TextStyle(color: Colors.white.withOpacity(0.7)),
                    decoration: InputDecoration(
                      hintText: '请在此输入你的NFT作品标题',
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
                      Text('作品简介',style: TextStyle(color: Colors.white,fontSize: 18),)
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white.withOpacity(0.3),
                    border: Border.all(color: Colors.white.withOpacity(0.7)),
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    style: TextStyle(color: Colors.white.withOpacity(0.7)),
                    decoration: InputDecoration(
                      hintText: '请在此输入你的NFT作品标题',
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
                    '发布作品',
                    style: TextStyle(color: Colors.white), // 设置字体颜色为白色
                  ),
                ),
                    ],
                  ),
                ),

              ],
            ),
          ),

        ),
      )
    );
  }
}
