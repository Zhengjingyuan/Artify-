

import 'package:flutter/material.dart';
import 'package:userprogram/base/components/NavBarItem.dart';
import 'package:userprogram/util/int_extention.dart';
import 'package:userprogram/util/size_fit.dart';
import 'package:userprogram/view/default_page.dart';
import 'package:userprogram/view/homeView/good_page.dart';
import 'package:userprogram/view/homeView/create_page.dart';
import 'package:userprogram/view/homeView/transaction_page.dart';
import 'package:userprogram/view/homeView/user_page.dart';
import 'package:userprogram/viewmodel/getUser_viewmodel.dart';
import 'package:userprogram/viewmodel/login_viewmodel.dart';

/**
 * 基础导航栏架构页面
 */

LoginViewModel loginViewModel=LoginViewModel();
GetUserViewMode getUserViewMode=GetUserViewMode();
var id=loginViewModel.storage.read(key: 'Token');
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override


  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  String _getAppBarTitle(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Create';
      case 2:
        return 'Transaction';
      case 3:
        return 'My';
      default:
        return 'Bottom Navigation Example';
    }
  }
  @override
  Widget build(BuildContext context) {
    HYSizeFit.initialize();

    return Scaffold(
      resizeToAvoidBottomInset: false, // 解决键盘顶起页面
      body: Stack(
        children: [
          _buildPage(_selectedIndex),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child:Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/assert/Rectangle 23.png'), // 替换成你想要设置的背景图片路径
                    fit: BoxFit.fill, // 适应容器大小，可以根据需求调整
                  ),
                  color: Colors.transparent,

              ),
              margin: EdgeInsets.symmetric(horizontal: 20.rpx, vertical: 10.rpx),
              padding: EdgeInsets.all(10.rpx),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NavBarItem(
                    iconPath: _selectedIndex == 0 ? 'lib/assert/Home 1.png' : 'lib/assert/Home 2.png',
                    title: 'Home',
                    index: 0,
                    onTabTapped: _onItemTapped,
                  ),
                  SizedBox(width: 4.rpx,),
                  NavBarItem(
                    iconPath: _selectedIndex == 1 ? 'lib/assert/tabler_eggs2.png' : 'lib/assert/tabler_eggs.png',
                    title: 'Create',
                    index: 1,
                    onTabTapped: _onItemTapped,
                  ),
                  SizedBox(width: 20.rpx,),
                  NavBarItem(
                    iconPath: _selectedIndex == 2 ? 'lib/assert/Group 43015.png' : 'lib/assert/material-symbols-light_swap-calls.png',
                    title: 'Transaction',
                    index: 2,
                    onTabTapped: _onItemTapped,
                  ),
                  NavBarItem(
                    iconPath: _selectedIndex == 3 ? 'lib/assert/Profile 2.png' : 'lib/assert/Profile 1.png',
                    title: 'My',
                    index: 3,
                    onTabTapped: _onItemTapped,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return GoodPage();
      case 1:
        return CreatePage();
      case 2:
        return TransactionPage();
      case 3:
        return UserPage();
      default:
        return DefaultPage();
    }
  }
}



