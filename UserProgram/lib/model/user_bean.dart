///UserDto
class UserRequest {
  UserRequest({
    this.password,
    this.phone,
  });

  String? password;
  String? phone;
}


///Result«User»
class Response {
  Response({
    this.code,
    this.data,
    this.msg,
  });

  int? code;
  User? data;
  String? msg;

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      code: json['code'],
      data: json['data'] != null ? User.fromJson(json['data']) : null,
      msg: json['msg'],
    );
  }
}



///User
class User {
  User({
    this.balance,
    this.createdAt,
    this.headImg,
    this.id,
    this.nickName,
    this.password,
    this.phone,
    this.signature,
    this.updatedAt,
  });


  ///余额
  double? balance;
  String? createdAt;
  String? headImg;
  int? id;
  String? nickName;
  String? password;
  String? phone;

  ///个性签名
  String? signature;
  String? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      balance: json['balance'] ?? 0.0,
      createdAt: json['createdAt'] ?? '',
      headImg: json['headImg'] ?? '',
      id: json['id'] ?? 0,
      nickName: json['nickName'] ?? '',
      password: json['password'] ?? '',
      phone: json['phone'] ?? '',
      signature: json['signature'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }


}



