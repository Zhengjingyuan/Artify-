import 'dart:convert';
import 'package:dio/dio.dart';
typedef Success = void Function(dynamic json);
typedef Fail = void Function(String ?reason, int ?code);
typedef After = void Function();
var headers = {
  'User-Agent': 'Apifox/1.0.0 (https://www.apifox.cn)',
  'Content-Type': 'application/json'
};
class Http {
  late Dio _dio;
  static Http _instance = Http._internal();
  factory Http() {
    return _instance;
  }
  Http._internal() {
    _dio = createDio();
  }
  Dio createDio() {
    var dio = Dio(BaseOptions(
      connectTimeout: Duration(milliseconds: 30000),
      receiveTimeout: Duration(milliseconds: 30000),
      sendTimeout: Duration(milliseconds: 30000),
      baseUrl: "http://sosd.fzuhuahuo.cn:16052/api/v1",
      responseType: ResponseType.json,
    ));
    return dio;
  }


  /**
   * 接口
   */

  Future<void> postLogin(String endpoint, Map<String, dynamic> data,
      {Success? success, Fail? fail, After? after}) {
    _dio.post(
      endpoint,
      data: jsonEncode(data),
      options: Options(headers: headers),
    ).then((response) {
      if (response.statusCode == 200) {
        if (success != null) {
          success(response.data);
        }
      } else {
        if (fail != null) {
          fail(response.statusMessage, response.statusCode);
        }
      }
      if (after != null) {
        after();
      }
    });
    return Future.value();
  }

  Future<void> postRegister(String endpoint, Map<String, dynamic> data,
      {Success? success, Fail? fail, After? after}) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: jsonEncode(data),
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        if (success != null) {
          success(response.data);
        }
      } else {
        if (fail != null) {
          fail(response.statusMessage, response.statusCode);
        }
      }
      if (after != null) {
        after();
      }
    } catch (e) {
      if (fail != null) {
        fail(e.toString(), 500); // You can customize the status code here
      }
    }
  }

  Future<void> postUpdate(String endpoint, Map<String, dynamic> data,
      {Success? success, Fail? fail, After? after}) async {
    try {
      final response = await _dio.post(
        endpoint,
        data:jsonEncode(data),
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        if (success != null) {
          success(response.data);
        }
      } else {
        if (fail != null) {
          fail(response.statusMessage, response.statusCode);
        }
      }
      if (after != null) {
        after();
      }
    } catch (e) {
      if (fail != null) {
        fail(e.toString(), 500); // You can customize the status code here
      }
    }
  }

  Future<void> getUser(String endpoint, int id,
      {Success? success, Fail? fail, After? after}) async {
    try {
      final response = await _dio.get( // 将 post 改为 get
        endpoint,
        queryParameters: {'id': id}, // 使用 queryParameters 传递参数
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        if (success != null) {
          success(response.data);
        }
      } else {
        if (fail != null) {
          fail(response.statusMessage, response.statusCode);
        }
      }
      if (after != null) {
        after();
      }
    } catch (e) {
      if (fail != null) {
        fail(e.toString(), 500); // You can customize the status code here
      }
    }
  }

  Future<void> getOnChain(String endpoint, Map<String, dynamic?> data,
      {void Function(dynamic)? success, void Function(String, int)? fail, void Function()? after}) async {
    try {
      final response = await _dio.get(
        endpoint,
        data: jsonEncode(data),
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        if (success != null) {
          success(response.data);
        }
      } else {
        if (fail != null) {
          fail(response.statusMessage ?? '', response.statusCode ?? 0);
        }
      }
      if (after != null) {
        after();
      }
    } catch (e) {
      if (fail != null) {
        fail(e.toString(), 500); // You can customize the status code here
      }
    }
  }

  Future<void> getCreateGood(String endpoint, Map<String, dynamic?> data,
      {void Function(dynamic)? success, void Function(String, int)? fail, void Function()? after}) async {
    try {
      final response = await _dio.get(
        endpoint,
        data: jsonEncode(data),
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        if (success != null) {
          success(response.data);
        }
      } else {
        if (fail != null) {
          fail(response.statusMessage ?? '', response.statusCode ?? 0);
        }
      }
      if (after != null) {
        after();
      }
    } catch (e) {
      if (fail != null) {
        fail(e.toString(), 500); // You can customize the status code here
      }
    }
  }

  Future<void> getMyGood(String endpoint, int userId,int page,int size,
      {void Function(dynamic)? success, void Function(String, int)? fail, void Function()? after}) async {
    try {
      final response = await _dio.get(
        endpoint,
          queryParameters: {'userId': userId,'page':page,'size':size},
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        if (success != null) {
          success(response.data);
        }
      } else {
        if (fail != null) {
          fail(response.statusMessage ?? '', response.statusCode ?? 0);
        }
      }
      if (after != null) {
        after();
      }
    } catch (e) {
      if (fail != null) {
        fail(e.toString(), 500); // You can customize the status code here
      }
    }
  }

  Future<void> postPrompt(String endpoint, String? text,
      {Success? success, Fail? fail, After? after}) {
    _dio.post(
      endpoint,
      queryParameters: {'text':text},
      options: Options(headers: headers),
    ).then((response) {
      if (response.statusCode == 200) {
        if (success != null) {
          success(response.data);
        }
      } else {
        if (fail != null) {
          fail(response.statusMessage, response.statusCode);
        }
      }
      if (after != null) {
        after();
      }
    });
    return Future.value();
  }
}