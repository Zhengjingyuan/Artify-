
import 'package:userprogram/model/update_bean.dart';

class GetResponse {
  int? code;
  UpRequest? data;
  String? msg;

  GetResponse({
    this.code,
    this.data,
    this.msg,
  });

  factory GetResponse.fromJson(Map<String, dynamic> json) {
    return GetResponse(
      code: json['code'],
      data: json['data'] != null ? UpRequest.fromJson(json['data']) : null,
      msg: json['msg'],
    );
  }
}

/// UserUpdateDto
// class UserUpdateDto {
//   double? balance;
//   String? headImg;
//   int? id;
//   String? nickName;
//   String? phone;
//
//   UserUpdateDto({
//     this.balance,
//     this.headImg,
//     this.id,
//     this.nickName,
//     this.phone,
//   });
//
//   factory UserUpdateDto.fromJson(Map<String, dynamic> json) {
//     return UserUpdateDto(
//       balance: json['balance'],
//       headImg: json['headImg'],
//       id: json['id'],
//       nickName: json['nickName'],
//       phone: json['phone'],
//     );
//   }
// }
