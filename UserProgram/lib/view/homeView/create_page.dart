import 'package:flutter/material.dart';
import 'package:userprogram/base/components/tagList.dart';
import 'package:userprogram/view/homeView/creatViews/creat_good_page.dart';

/**
 * 孵化池页面
 */
class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2, // 设置两个tab
        child: Scaffold(
          appBar: AppBar(
            title:Column(
                children: [
            TabBar(
            tabs: [
            Tab(text: '孵化大厅'),
            Tab(text: '创作台'),
            ],
          ),]
          ),
      ),
          body: TabBarView(
            children: [
              Page1(),
              Page2(),
            ],
          ),
        ),
      ),
    );
  }
}

/**
 * 孵化大厅
 */
class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
     children: [
       Container(
         child: Column(
           children: [
             TagList(),
              CreateGoodPage(),
           ],
         )
       )
     ],
    );
  }
}

/**
 * 创作台
 */
class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('内容2'),
    );
  }
}
