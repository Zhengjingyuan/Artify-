import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 首页的底部悬浮导航栏
 */
class NavBarItem extends StatelessWidget {
  final String iconPath;
  final String title;
  final int index;
  final Function(int) onTabTapped;

  NavBarItem({
    required this.iconPath,
    required this.title,
    required this.index,
    required this.onTabTapped,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTabTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            iconPath,
            color: Colors.white,
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}