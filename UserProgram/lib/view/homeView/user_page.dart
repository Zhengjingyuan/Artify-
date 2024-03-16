import 'package:flutter/material.dart';
import 'package:userprogram/base/provider_widget.dart';
import 'package:userprogram/common/Routes.dart';
import 'package:userprogram/view/home_page.dart';
import 'package:userprogram/viewmodel/getUser_viewmodel.dart';
/**
 * 个人中心页面
 */

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<GetUserViewMode>(
      model: GetUserViewMode(), // 实例化你的ViewModel
      onReady: (model) async {
        String? id = await loginViewModel.storage.read(key: 'token');
        if (id != null) {
          int? userId = int.tryParse(id);
          if (userId != null) {
            await model.getUser(userId); // Make sure to await for the getUser method
          } else {
            // 处理无法将id解析为整数的情况
            print('Error: Unable to parse id to integer');
          }
        } else {
          // 处理id为null的情况
          print('Error: id is null');
        }
      },
      builder: (context, model, child) {
        return Scaffold(
          body: ListView(
            children: [
              ListTile(
                contentPadding: EdgeInsets.all(8.0),
                leading: CircleAvatar(
                  radius: 60,
                  backgroundImage: model.getuser.headImg!= null
                      ? Image.network(model.getuser.headImg as String).image
                      : AssetImage('lib/assert/profile.png'),

                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model.getuser.nickName ?? '创作家0001', style: TextStyle(fontSize: 24)),
                    ElevatedButton(
                      onPressed: () {
                        // 点击编辑资料按钮触发的操作
                        Navigator.pushReplacementNamed(context, Routes.updateRoute);
                      },
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(100, 30)),
                      ),
                      child: Text('编辑资料', style: TextStyle(fontSize: 12)),
                    ),
                  ],
                ),
              ),
              _buildListItem(Icons.person, '个人主页', () {
                // 点击跳转到个人主页
                // TODO: 添加跳转逻辑
              }),
              _buildListItem(Icons.shopping_cart, '订单', () {
                // 点击跳转到订单页面
                // TODO: 添加跳转逻辑
              }),
              _buildListItem(Icons.collections, '藏品管理', () {
                // 点击跳转到藏品管理页面
                // TODO: 添加跳转逻辑
              }),
              _buildListItem(Icons.favorite, '收藏', () {
                // 点击跳转到收藏页面
                // TODO: 添加跳转逻辑
              }),
              _buildListItem(Icons.comment, '获得的评论', () {
                // 点击跳转到获得的评论页面
                // TODO: 添加跳转逻辑
              }),
              _buildListItem(Icons.thumb_up, '点赞', () {
                // 点击跳转到点赞页面
                // TODO: 添加跳转逻辑
              }),
              _buildListItem(Icons.thumb_up, '登出', () {

                loginViewModel.logout();
                Navigator.pushReplacementNamed(context, Routes.loginRoute);

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => UserUpdatePage(user: model.getuser),
                //   ),
                // );

              }),
            ],
          ),
        );
      }, child: Container(),
    );
  }
  Widget _buildListItem(IconData icon, String text, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: onTap,
    );
  }

}
