import 'package:flutter/material.dart';
import 'package:userprogram/base/provider_widget.dart';
import 'package:userprogram/common/Routes.dart';
import 'package:userprogram/view/default_page.dart';
import 'package:userprogram/view/homeView/good_page.dart';
import 'package:userprogram/view/homeView/create_page.dart';
import 'package:userprogram/view/homeView/transaction_page.dart';
import 'package:userprogram/view/homeView/user_page.dart';
import 'package:userprogram/view/userUpdate_page.dart';
import 'package:userprogram/viewmodel/getUser_viewmodel.dart';
import 'package:userprogram/viewmodel/login_viewmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
        return '首页';
      case 1:
        return '孵化池';
      case 2:
        return '流转中心';
      case 3:
        return '个人中心';
      default:
        return 'Bottom Navigation Example';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        child: _buildPage(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: '孵化池',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: '流转中心',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: '个人中心',
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
