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
      title: Row(
        children: <Widget>[
          FlutterLogo(size: 30.0),
          SizedBox(width: 10.0),
          Expanded(
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // 在此处处理搜索逻辑
            },
          ),

        ],
      ),
    );
  }
}