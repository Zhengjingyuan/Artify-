import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:userprogram/base/base_viewmodel.dart';
import 'package:userprogram/base/network/http.dart';
import 'package:userprogram/common/Urls.dart';
import 'package:userprogram/model/create/prompt_bean.dart';

class PromptViewModel extends BaseViewModel{
  late String? imageString=null;
  bool isImageString=false;

  Future<void> postPrompt(String pr) async {
    Completer<void> completer = Completer<void>();

    Http().postPrompt(
      Urls.prompt,
      pr,
      success: (json) {
        PromptResponse response = PromptResponse.fromJson(json);
        if (response.code==200) {
          imageString=response.data!;
          notifyListeners();
          // 更新用户数据成功
          debugPrint(' Prompt successfully');
          debugPrint(imageString);
          isImageString=true;

        } else {
          // 更新用户数据失败
          debugPrint('Failed to prompt: ${response.msg}');
        }
      },
      fail: (reason, statusCode) {
        debugPrint('Prompt failed: $reason');
      },
      after: () {
        // 在更新资料之后可能需要执行的操作，可留空
      },
    );

    return completer.future; // 返回Future
  }
}