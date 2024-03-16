

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      appBar: ArtifyAppBar(title: "登录", canBack: false).build(context),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                labelText: '手机号码',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: '密码',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String phoneNumber = phoneNumberController.text;
                String password = passwordController.text;
                login(phoneNumber, password);
                Navigator.pushReplacementNamed(context, Routes.homeRoute);

              },
              child: Text('登录'),
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
