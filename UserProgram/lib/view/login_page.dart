

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:userprogram/util/int_extention.dart';
import 'package:userprogram/widget/ArtifyAppBar.dart';

import '../base/provider_widget.dart';
import '../common/Routes.dart';
import '../model/user_bean.dart';
import '../viewmodel/login_viewmodel.dart';

/**
 * 登录页面
 */

TextEditingController phoneNumberController = TextEditingController();
TextEditingController passwordController = TextEditingController();


class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assert/bk.png'), // 替换成你想要设置的背景图片路径
            fit: BoxFit.cover, // 适应容器大小，可以根据需求调整
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.rpx),
          child: Column(
            children: <Widget>[
              SizedBox(height: 130.rpx,),
              Text('藏镜',style: TextStyle(color: Colors.white,fontSize: 34,fontWeight: FontWeight.bold),),
              SizedBox(height: 70.rpx,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 28.rpx,),
                  Text('账号',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(height: 10.rpx,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.rpx),
                decoration: BoxDecoration(
                  color: Colors.transparent, // 设置背景色为半透明灰色
                  borderRadius: BorderRadius.circular(32), // 设置圆角边框
                  border: Border.all(color: Colors.white24,width: 2)
                ),
                child: TextField(
                  controller: phoneNumberController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: '请输入账号', // 输入框提示文本
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.7),fontSize: 16.rpx),
                    border: InputBorder.none, // 去除默认边框
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.rpx), // 设置内容内边距
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 28.rpx,),
                  Text('密码',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(height: 10.rpx,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.rpx),
                decoration: BoxDecoration(
                    color: Colors.transparent, // 设置背景色为半透明灰色
                    borderRadius: BorderRadius.circular(32), // 设置圆角边框
                    border: Border.all(color: Colors.white24,width: 2)
                ),
                child: TextField(
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: '请输入密码', // 输入框提示文本
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.7),fontSize: 16.rpx),
                    border: InputBorder.none, // 去除默认边框
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.rpx), // 设置内容内边距

                  ),
                ),
              ),
              SizedBox(height: 120.rpx),
              ElevatedButton(
                onPressed: () {
                  String phoneNumber = phoneNumberController.text;
                  String password = passwordController.text;
                  login(phoneNumber, password);
                  Navigator.pushReplacementNamed(context, Routes.homeRoute);
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(Size(216.rpx, 50.rpx)),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black), // 设置按钮背景色为黑色
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // 设置按钮圆角
                      side: BorderSide(color: Colors.white,width: 1), // 设置按钮边框为白色
                    ),
                  ),
                ),
                child: Text('登   录', style: TextStyle(color: Colors.white)), // 设置文字颜色为白色
              ),
              SizedBox(height: 10),
              CupertinoButton(
                onPressed: () {
                  // 跳转到注册页面
                  Navigator.pushReplacementNamed(context, Routes.registerRoute);
                },
                child: Text('没有账号？去注册'),
              ),
            ],
          ),
        ),
      )
    );
  }
}

void login(String phoneNumber, String password) {
  if (phoneNumber.isEmpty || password.isEmpty) {
    // 输入为空，提示用户输入账号密码
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('请输入账号和密码')));
    print("请输入账号密码");
  } else {
    UserRequest userRequest = UserRequest(phone: phoneNumber, password: password);
    LoginViewModel loginViewModel = LoginViewModel();
    // 调用登录方法
    loginViewModel.login(userRequest);
  }
}

void _showRegisterSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('注册成功'),
        content: Text('恭喜您，注册成功！'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('确定'),
          ),
        ],
      );
    },
  );
}
