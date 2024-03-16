import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:userprogram/base/base_viewmodel.dart';
import 'package:userprogram/common/Routes.dart';
import 'package:userprogram/common/Urls.dart';
import 'package:userprogram/view/home_page.dart';
import '../base/network/http.dart';
import '../model/user_bean.dart';
import '../model/update_bean.dart';
class LoginViewModel extends BaseViewModel {
  late User currentUser = User(); // 添加初始化值
  late String token = ''; // 添加初始化值
  final storage = FlutterSecureStorage();


  /**
   * 登录判断
   */
  Future<bool> isLoggedIn() async {
    String? token = await storage.read(key: 'token');
    return token != null;
  }

  /**
   * 登录
   */
  Future<void> login(UserRequest userRequest) async {
    Map<String, dynamic> loginData = {
      'phone': userRequest.phone ?? '',
      'password': userRequest.password ?? '',
    };
    String jsonLoginData = jsonEncode(loginData);

      Http().postLogin(
        Urls.login,
        loginData,
        success: (json) {
          Response response = Response.fromJson(json);
          User userData = response.data!;
          currentUser = userData;
          // 检查token是否在response.data中
          if (response.data != null && response.data!.id!= null) {
            token = response.data!.id.toString();
            saveUserDataLocally(currentUser, token);
            notifyListeners();
            debugPrint('Logged in as ${currentUser.nickName}');
            debugPrint('Token: $token');

          } else {
            // 如果需要，处理token为null的情况
            debugPrint('Token is null');
          }
        },
        fail: (reason, statusCode) {
          debugPrint('Login failed: $reason');
        },
        after: () {
          // 在登录之后需要执行的操作，可留空
        },
      );


  }

  void saveUserDataLocally(User user, String token) {
    storage.write(key: 'token', value: token);

    // 根据您的User类的数据结构，存储用户相关信息
    // 例如：storage.write(key: 'username', value: user.user

  }
  Future<void> logout() async {
    await storage.delete(key: 'token');
    // 根据具体的User类数据结构，清除其他用户信息如用户名等
    // await storage.delete(key: 'username');
    // 这里可以添加其他退出登录时需要执行的操作
  }

/**
 * 更新
 */
  Future<void> update(UpRequest user) async {
    Map<String, dynamic> updateData = {
      'id': 21,
      'nickName': user.nickName,
      'phone': user.phone,
      'headImage':user.headImg
    };

    Http().postUpdate(
      Urls.update,
      updateData,
      success: (json) {
        UpResponse response = UpResponse.fromJson(json);
        if (response.code==200) {
          // 更新用户数据成功
          debugPrint(' updated successfully');
          notifyListeners();
        } else {
          // 更新用户数据失败
          debugPrint('Failed to update profile: ${response.msg}');
        }
      },
      fail: (reason, statusCode) {
        debugPrint('Profile update failed: $reason');
      },
      after: () {
        // 在更新资料之后可能需要执行的操作，可留空
      },
    );
  }




  }