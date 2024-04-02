import 'package:flutter/material.dart';
class ProfilePage extends StatelessWidget {
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
                title: Text('设置',style: TextStyle(color: Colors.white),),
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);

                  },
                ),
              ),
              ListTile(
                leading: Icon(Icons.person, color: Colors.white),
                title: Text('账号与安全', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // 处理"个人资料"按钮的点击事件
                },
              ),
              ListTile(
                leading: Icon(Icons.comment, color: Colors.white),
                title: Text('消息通知设置', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // 处理"相册"按钮的点击事件
                },
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.white),
                title: Text('通用设置', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // 处理"设置"按钮的点击事件
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app, color: Colors.white),
                title: Text('退出登录', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // 处理"退出登录"按钮的点击事件
                  // TODO: 执行退出登录的逻辑
                },
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