import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:userprogram/view/default_page.dart';
import 'package:userprogram/view/home_page.dart';
import 'package:userprogram/view/login_page.dart';
import 'package:userprogram/view/register_page.dart';
import 'package:userprogram/view/userUpdate_page.dart';

import '../view/splash_page.dart';

class Routes{
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String homeRoute = '/home';
  static const String updateRoute = '/update';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case registerRoute:
        return MaterialPageRoute(builder: (_)=>RegisterPage());
      case homeRoute:
        return MaterialPageRoute(builder: (_)=>HomePage());
      case updateRoute:
        return MaterialPageRoute(builder: (_)=>UserUpdatePage());
      default:
        return MaterialPageRoute(builder: (_) => DefaultPage());
    }
  }
}