class UpRequest {
  double? balance;
  String? headImg;
  int? id;
  String? nickName;
  String? phone;

  UpRequest({
    this.balance,
    this.headImg,
    this.id,
    this.nickName,
    this.phone,
  });
  // 从Map解析得到UpRequest对象
  factory UpRequest.fromJson(Map<String, dynamic> json) {
    return UpRequest(
      balance: json['balance'] ?? 0.0,
      headImg: json['headImg'] ?? '',
      id: json['id'] ?? 0,
      nickName: json['nickName'] ?? '',
      phone: json['phone'] ?? '',
    );
  }
}
class UpResponse {
  int? code;
  bool? data;
  String? msg;
  // 构造函数
  UpResponse({
    this.code,
    this.data,
    this.msg,
  });
  // 从Map解析得到UpResponse对象
  factory UpResponse.fromJson(Map<String, dynamic> json) {
    return UpResponse(
      code: json['code'] ?? 0,
      data: json['data'] ?? false,
      msg: json['msg'] ?? '',
    );
  }
}