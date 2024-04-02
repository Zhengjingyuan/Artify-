
///com.huahuo.szcp.common.PageResult<java.util.List<com.huahuo.szcp.pojo.Collection>>
///
///PageResult«List«Collection»»
class MyGoodResponse {
  int? code;
  List<MyGood>? data;
  String? msg;
  int? total;

  MyGoodResponse({
    this.code,
    this.data,
    this.msg,
    this.total,
  });

  factory MyGoodResponse.fromJson(Map<String, dynamic> json) {
    return MyGoodResponse(
      code: json['code'],
      data: List<MyGood>.from(json['data'].map((x) => MyGood.fromJson(x))),
      msg: json['msg'],
      total: json['total'],
    );
  }

}


///藏品信息表
///
///Collection
class MyGood {

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

  MyGood({
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

  factory MyGood.fromJson(Map<String, dynamic> json) {
    return MyGood(
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