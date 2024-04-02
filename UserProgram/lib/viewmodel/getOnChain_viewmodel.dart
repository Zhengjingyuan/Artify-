import 'dart:async';

import 'package:flutter/material.dart';
import 'package:userprogram/base/base_viewmodel.dart';
import 'package:userprogram/base/network/http.dart';
import 'package:userprogram/common/Urls.dart';
import 'package:userprogram/model/home_good/onchain_bean.dart';

class GetOnChainGoodViewModel extends BaseViewModel {
  List<OnChainGood> onChainGoodList1 = [];
  Future<void> getOnChainGood1() async {
    Completer<void> completer = Completer<void>();

    Map<String, dynamic> getOnChainData = {
      'page': 1,
      'size': 10,
      'text': '',
      'sortType': 0,
      'category': '',
    };

    Http().getOnChain(
      Urls.getOnChain, // 假设这是获取链上商品信息的接口地址
      getOnChainData,
      success: (json) {
        OnChainResponse response = OnChainResponse.fromJson(json);
        if (response.code == 200) {
          onChainGoodList1 = response.data!;
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