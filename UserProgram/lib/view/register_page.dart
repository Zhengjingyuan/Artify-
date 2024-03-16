import 'package:flutter/material.dart';
import 'package:userprogram/model/user_bean.dart';
import 'package:userprogram/viewmodel/register_viewmodel.dart';

import '../common/Routes.dart';
/**
 * 注册页面
 */

TextEditingController phoneNumberController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册'),
      ),
      body: Center(
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
                // 注册逻辑
                String phoneNumber = phoneNumberController.text;
                String password = passwordController.text;
                register(phoneNumber, password);

                  _showRegisterSuccessDialog(context);

                  Future.delayed(Duration(seconds: 1), () {
                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  });

              },
              child: Text('注册'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('已有账号？去登录'),
            ),
          ],
        ),
      ),
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