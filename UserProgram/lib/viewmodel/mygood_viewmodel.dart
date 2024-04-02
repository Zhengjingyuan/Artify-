import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:userprogram/base/base_viewmodel.dart';
import 'package:userprogram/base/network/http.dart';
import 'package:userprogram/common/Urls.dart';
import 'package:userprogram/model/my_good/mygood_bean.dart';

class MyGoodViewModel extends BaseViewModel{
  List<MyGood> MyGoodList = [];
  Future<void> getMyGood() async {
    Completer<void> completer = Completer<void>();

    Http().getMyGood(
      Urls.getMyGood, // 假设这是获取链上商品信息的接口地址
      27,
      1,
      0,
      success: (json) {
        MyGoodResponse response = MyGoodResponse.fromJson(json);
        if (response.code == 200) {
          MyGoodList  = response.data!;
          debugPrint('Get on-chain good successfully');

          notifyListeners(); // 通知UI更新
          completer.complete(); // 完成Future
        } else {
          debugPrint('Failed to get on-chain good: ${response.msg}');
          completer.completeError('Failed to get on-chain good: ${response.msg}');
        }
      },
      fail: (reason, statusCode) {
        debugPrint('Get on-chain good failed: $reason');
        notifyListeners(); // 通知UI更新
        completer.completeError('Get on-chain good failed: $reason');
      },
      after: () {
        // 可以在这里执行一些清理工作，如果需要的话
      },
    );

    return completer.future; // 返回Future
  }
}