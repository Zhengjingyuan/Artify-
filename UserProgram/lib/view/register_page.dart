import 'package:flutter/material.dart';
import 'package:userprogram/model/user_bean.dart';
import 'package:userprogram/util/int_extention.dart';
import 'package:userprogram/util/size_fit.dart';
import 'package:userprogram/viewmodel/register_viewmodel.dart';

import '../common/Routes.dart';
/**
 * 注册页面
 */

TextEditingController phoneNumberController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController passwordController2 = TextEditingController();

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    HYSizeFit.initialize();
    return Scaffold(
        resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration:BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assert/bk.png'), // 替换成你想要设置的背景图片路径
            fit: BoxFit.cover, // 适应容器大小，可以根据需求调整
          ),
        ) ,
        child: Padding(
          padding: EdgeInsets.all(20.rpx),
          child: Column(
            children: <Widget>[
              SizedBox(height: 130.rpx,),
              Text('藏境',style: TextStyle(color: Colors.white,fontSize: 34,fontWeight: FontWeight.bold),),
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
                  decoration: InputDecoration(
                    labelText: '手机号码',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.7),fontSize: 16.rpx),
                    border: InputBorder.none, // 去除默认边框
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.rpx),
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
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: '密码',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.7),fontSize: 16.rpx),
                    border: InputBorder.none, // 去除默认边框
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.rpx),
                  ),
                  obscureText: true,
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
                  controller: passwordController2,
                  decoration: InputDecoration(
                    labelText: '确认密码',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.7),fontSize: 16.rpx),
                    border: InputBorder.none, // 去除默认边框
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.rpx),
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(height: 120.rpx),
              ElevatedButton(
                onPressed: () {
                  // 注册逻辑
                  String phoneNumber = phoneNumberController.text;
                  String password = passwordController.text;
                  String password2 = passwordController2.text;
                  register(phoneNumber, password);

                  _showRegisterSuccessDialog(context);

                  Future.delayed(Duration(seconds: 1), () {
                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  });

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
                child: Text('注册',style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                },
                child: Text('已有账号？去登录'),
              ),
            ],
          ),
        )
      )
    );
  }

  void register(String phoneNumber, String password) {
    if (phoneNumber.isEmpty || password.isEmpty) {
      // 输入为空，提示用户输入账号密码
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('请输入账号和密码')));
      print("请输入账号密码");
    } else {
      UserRequest userRequest = UserRequest(phone: phoneNumber, password: password);
      RegisterViewModel registerViewModel = RegisterViewModel();
      // 调用注册方法
      registerViewModel.register(userRequest);
    }
  }
}

void _showRegisterSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('注册成功'),
        content: Text('恭喜您，注册成功！'),
      );
    },
  );
}