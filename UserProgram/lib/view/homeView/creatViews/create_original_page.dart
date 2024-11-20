import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:userprogram/common/Routes.dart';
import 'package:userprogram/util/int_extention.dart';
import 'package:userprogram/util/size_fit.dart';

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
TextEditingController titleController=TextEditingController();
TextEditingController descriptionController=TextEditingController();
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
    HYSizeFit.initialize();
    return Scaffold(

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
                  height: 20.rpx,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.rpx,vertical: 10.rpx),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('作品预览',style: TextStyle(color: Colors.white,fontSize: 18.px),)
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: getImage,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.rpx),
                    height: 240.rpx,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white.withOpacity(0.3),
                      border: Border.all(color: Colors.white.withOpacity(0.7)),
                    ),
                    padding: EdgeInsets.all(8.rpx),
                    child: Center(
                      //child: Image.asset('lib/assert/chushu.png',fit: BoxFit.fitWidth,),
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
                  padding: EdgeInsets.symmetric(horizontal: 16.rpx,vertical: 10.rpx),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('作品标题',style: TextStyle(color: Colors.white,fontSize: 18.rpx),)
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.rpx),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white.withOpacity(0.3),
                    border: Border.all(color: Colors.white.withOpacity(0.7)),
                  ),
                  padding: EdgeInsets.all(8.rpx),
                  child: TextField(
                    controller: titleController,
                    style: TextStyle(color: Colors.white.withOpacity(0.7)),
                    decoration: InputDecoration(
                      hintText: '请在此输入你的NFT作品标题',
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.5),fontSize: 14.rpx),
                      border: InputBorder.none, // 隐藏输入框默认边框
                      contentPadding: EdgeInsets.symmetric(horizontal: 6.rpx,vertical: 10.rpx), // 设置内边距
                    ),
                    maxLines: 1,

                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.rpx,vertical: 10.rpx),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('作品简介',style: TextStyle(color: Colors.white,fontSize: 18.rpx),)
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.rpx),
                  height: 160.rpx,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white.withOpacity(0.3),
                    border: Border.all(color: Colors.white.withOpacity(0.7)),
                  ),
                  padding: EdgeInsets.all(8.rpx),
                  child: TextField(
                    controller: descriptionController,
                    style: TextStyle(color: Colors.white.withOpacity(0.7)),
                    decoration: InputDecoration(
                      hintText: '请在此输入你的NFT作品简介',
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.5),fontSize: 14.rpx),
                      border: InputBorder.none, // 隐藏输入框默认边框
                      contentPadding: EdgeInsets.symmetric(horizontal: 6.rpx,vertical: 10.rpx), // 设置内边距
                    ),
                    maxLines: 1,

                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.rpx,vertical: 10.rpx),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                      onPressed: () {
                        String title=titleController.text;
                        String description=descriptionController.text;
                        if(title.isEmpty||description.isEmpty){
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
                                      Text("请完成作品信息填写！",style: TextStyle(color: Colors.white,fontSize: 14),),
                                      SizedBox(height: 16.0),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                          return;
                        }

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
                                    Text("作品发布成功！",style: TextStyle(color: Colors.white,fontSize: 14.rpx),),
                                    Text("作品将会进入审核状态，请耐心等待",style: TextStyle(color: Colors.white,fontSize: 14.rpx),),
                                    SizedBox(height: 16.rpx),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                        Future.delayed(Duration(seconds: 1), () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        });



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
