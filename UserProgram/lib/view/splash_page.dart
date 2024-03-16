import 'package:flutter/material.dart';
import 'package:userprogram/viewmodel/login_viewmodel.dart';
import '../common/Routes.dart';
class SplashPage extends StatefulWidget {

  /**
   * 开屏页面
   */
  @override
  _SplashPageState createState() => _SplashPageState();
}
class _SplashPageState extends State<SplashPage> {
  double _opacity = 0.0;
  @override


  void initState() {
    super.initState();
    checkLoginStatus();
  }

  /**
   * 检查是否登录，如果登录了就跳转首页，否则跳转注册页面
   */
  void checkLoginStatus() async {
    final viewModel = LoginViewModel();
    bool isLoggedIn = await viewModel.isLoggedIn();

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _opacity = 1.0;
      });
    });
    Future.delayed(Duration(seconds: 3), () {
      if(isLoggedIn){
        Navigator.pushReplacementNamed(context, Routes.homeRoute);
      } else {
        Navigator.pushReplacementNamed(context, Routes.loginRoute);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: AnimatedOpacity(
            duration: Duration(seconds: 2),
            opacity: _opacity,
            child: Text(
              'Artify+',
              style: TextStyle(
                fontSize: 30.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}