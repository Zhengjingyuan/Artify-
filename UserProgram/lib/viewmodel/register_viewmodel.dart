import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:userprogram/base/base_viewmodel.dart';
import 'package:userprogram/base/network/http.dart';
import 'package:userprogram/common/Urls.dart';
import 'package:userprogram/model/user_bean.dart';

class RegisterViewModel extends BaseViewModel{

  Future<void> register(UserRequest userRequest) async {
    Map<String, dynamic> registerData = {
      'phone': userRequest.phone ?? '',
      'password': userRequest.password ?? '',
    };

    Http().postRegister(
      Urls.register,
      registerData,
      success: (json) {
        if (json != null) {
          // 从返回数据中取出data字段，然后解析为User对象
          Response response = Response.fromJson(json);
          User? userData = response.data;
          if (userData != null) {
            debugPrint('Register suceess!');
          } else {
            debugPrint('User data is null');
          }
        } else {
          debugPrint('JSON response is null');
        }
      },
      fail: (reason, statusCode) {
        debugPrint('Register failed: $reason');
      },
      after: () {
        // 在登录之后需要执行的操作，可留空
      },
    );
  }
}