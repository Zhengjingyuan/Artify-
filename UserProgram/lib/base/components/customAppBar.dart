import 'package:flutter/material.dart';

/**
 * 带有搜索的bar组件
 */
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  CustomAppBar()
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0, // 阴影
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset('lib/assert/profile.png', width: 40, height: 40), // 左侧logo，需替换为实际logo的路径
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('lib/assert/profile.png'), // 右侧头像，需替换为实际头像的路径
          ),
        ),
      ],
    );
  }
}