
import 'dart:convert';

///GetCollectionsDto
class CreateRequest {
  String? category;
  int? page;
  int? size;
  int? sortType;
  String? text;

  CreateRequest({
    this.category,
    this.page,
    this.size,
    this.sortType,
    this.text,
  });

  factory CreateRequest.fromJson(Map<String, dynamic> json) {
    return CreateRequest(
      category: json['category'],
      page: json['page'],
      size: json['size'],
      sortType: json['sortType'],
      text: json['text'],
    );
  }

}


///com.huahuo.szcp.common.PageResult<java.util.List<com.huahuo.szcp.pojo.Collection>>
///
///PageResult«List«Collection»»
class CreateGoodResponse {
  int? code;
  List<CreateGood>? data;
  String? msg;
  int? total;

  CreateGoodResponse({
    this.code,
    this.data,
    this.msg,
    this.total,
  });

  factory CreateGoodResponse.fromJson(Map<String, dynamic> json) {
    return CreateGoodResponse(
      code: json['code'],
      data: json['data'] != null ? List<CreateGood>.from(json['data'].map((x) => CreateGood.fromJson(x))) : null,
      msg: json['msg'],
      total: json['total'],
    );
  }



}


///藏品信息表
///
///Collection
class CreateGood {

  ///区块链地址
  String? blockchainAddress;

  ///分类
  String? category;
  int? commentsNum;

  ///创建时间
  String? createdAt;

  ///制作者
  int? creator;

  ///藏品介绍
  String? description;

  ///热度
  int? hotValue;
  int? id;

  ///图片链接
  String? imageUrl;

  ///是否上链
  bool? isOnChain;

  ///喜欢数
  int? likeNum;

  ///藏品名称
  String? name;
  String? onChainTime;

  ///拥有者
  int? owner;

  ///价格
  double? price;

  ///份数
  int? quantity;

  ///0代表官方 1代表原创 2代表AI
  int? type;

  ///修改时间
  String? updatedAt;

  CreateGood({
    this.blockchainAddress,
    this.category,
    this.commentsNum,
    this.createdAt,
    this.creator,
    this.description,
    this.hotValue,
    this.id,
    this.imageUrl,
    this.isOnChain,
    this.likeNum,
    this.name,
    this.onChainTime,
    this.owner,
    this.price,
    this.quantity,
    this.type,
    this.updatedAt,
  });

  factory CreateGood.fromJson(Map<String, dynamic> json) {
    return CreateGood(
      blockchainAddress: json['blockchainAddress'],
      category: json['category'],
      commentsNum: json['commentsNum'],
      createdAt: json['createdAt'],
      creator: json['creator'],
      description: json['description'],
      hotValue: json['hotValue'],
      id: json['id'],
      imageUrl: json['imageUrl'],
      isOnChain: json['isOnChain'],
      likeNum: json['likeNum'],
      name: json['name'],
      onChainTime: json['onChainTime'],
      owner: json['owner'],
      price: json['price'],
      quantity: json['quantity'],
      type: json['type'],
      updatedAt: json['updatedAt'],
    );
  }


}