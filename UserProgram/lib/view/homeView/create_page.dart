import 'package:flutter/material.dart';
import 'package:userprogram/base/components/createNavBar.dart';
import 'package:userprogram/base/components/tagList.dart';
import 'package:userprogram/view/homeView/creatViews/create_page1.dart';
import 'package:userprogram/view/homeView/creatViews/create_page2.dart';

/**
 * 孵化池页面
 */
class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  int _selectedIndex = 0;
  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assert/bk.png'), // 替换成你想要设置的背景图片路径
            fit: BoxFit.cover, // 适应容器大小，可以根据需求调整
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              height: 60, // 设置导航栏高度为80
              child: CreateNavBar(
                selectedIndex: _selectedIndex,
                onTabSelected: _onTabSelected,
              ),
            ),
            Expanded(
              child: _selectedIndex == 0 ? CreatePage1() : CreatePage2(),
            ),
          ],
        ),
      ),
    );
  }
}

