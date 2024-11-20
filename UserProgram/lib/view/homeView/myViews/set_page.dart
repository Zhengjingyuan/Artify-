import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:userprogram/common/Routes.dart';
import 'package:userprogram/viewmodel/login_viewmodel.dart';
class ProfilePage extends StatelessWidget {

  LoginViewModel loginViewModel=LoginViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assert/bk.png'), // 替换为您自己的图片路径
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                centerTitle: true,
                title: Text(
                  'Setting',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  // 处理账号与安全按钮的点击事件
                },
                child: ListTile(
                  leading: Icon(Icons.person, color: Colors.white),
                  title: Text('Account and Security', style: TextStyle(color: Colors.white)),
                ),
              ),
              TextButton(
                onPressed: () {
                  // 处理消息通知设置按钮的点击事件
                },
                child: ListTile(
                  leading: Icon(Icons.comment, color: Colors.white),
                  title: Text('Message notification settings', style: TextStyle(color: Colors.white)),
                ),
              ),
              TextButton(
                onPressed: () {
                  // 处理通用设置按钮的点击事件
                },
                child: ListTile(
                  leading: Icon(Icons.settings, color: Colors.white),
                  title: Text('Common Setting', style: TextStyle(color: Colors.white)),
                ),
              ),
              TextButton(
                onPressed: () {
                  loginViewModel.logout();
                  SystemNavigator.pop();
                },
                child: ListTile(
                  leading: Icon(Icons.exit_to_app, color: Colors.white),
                  title: Text('Log out', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
  ));
}