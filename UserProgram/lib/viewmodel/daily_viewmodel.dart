import 'dart:async';

import 'package:flutter/material.dart';
import 'package:userprogram/base/base_viewmodel.dart';
import 'package:userprogram/base/network/http.dart';
import 'package:userprogram/common/Urls.dart';
import 'package:userprogram/model/home_good/onchain_bean.dart';

class GetDailyRankViewModel extends BaseViewModel {
  List<OnChainGood> dailyRankList = [];
  Future<void> getdailyRank() async {
    Completer<void> completer = Completer<void>();

    Http().getDailyRank(
      Urls.dailyRank,
      success: (json) {
        OnChainResponse response = OnChainResponse.fromJson(json);
        if (response.code == 200) {
          dailyRankList = response.data!;
          debugPrint('Get dailyRank good successfully');

          notifyListeners(); // 通知UI更新
          completer.complete(); // 完成Future
        } else {
          debugPrint('Failed to get dailyRank good: ${response.msg}');
          completer.completeError('Failed to get odailyRank good: ${response.msg}');
        }
      },
      fail: (reason, statusCode) {
        debugPrint('Get dailyRank failed: $reason');
        notifyListeners(); // 通知UI更新
        completer.completeError('Get dailyRank good failed: $reason');
      },
      after: () {
        // 可以在这里执行一些清理工作，如果需要的话
      },
    );

    return completer.future; // 返回Future
  }
}