import 'package:flutter/material.dart';
import 'package:userprogram/base/base_viewmodel.dart';
import 'package:userprogram/base/network/http.dart';
import 'package:userprogram/common/Urls.dart';
import 'package:userprogram/model/getUser_bean.dart';
import 'package:userprogram/model/update_bean.dart';

class GetUserViewMode extends BaseViewModel{
  UpRequest _user = UpRequest();
  late UpRequest getuser=UpRequest();

  Future<void> getUser(int id) async {

    Http().getUser(
      Urls.getUser,
      id,
      success: (json) {
        GetResponse response = GetResponse.fromJson(json);
        getuser=response.data!;
        notifyListeners();
        if (response.code==200) {
          // 更新用户数据成功
          debugPrint(' get successfully');

        } else {
          // 更新用户数据失败
          debugPrint('Failed to get: ${response.msg}');
        }
      },
      fail: (reason, statusCode) {
        debugPrint('get failed: $reason');
      },
      after: () {
        // 在更新资料之后可能需要执行的操作，可留空
      },
    );
  }


  void updateUser(UpRequest newUser) {
    _user = newUser;
    getuser = newUser;
    notifyListeners();
  }
}