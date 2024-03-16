
///GetCollectionsDto
class ChiRequest {
  String? category;
  int? page;
  int? size;
  bool? sortByTime;
  String? text;

  ChiRequest({
    this.category,
    this.page,
    this.size,
    this.sortByTime,
    this.text,
  });

}


///PageResult«List«Collection»»
class ChiResponse {
  int? code;
  List<Collection>? data;
  String? msg;
  int? total;

  ChiResponse({
    this.code,
    this.data,
    this.msg,
    this.total,
  });

}


///藏品信息表
///
///Collection
class Collection {

  ///区块链地址
  String? blockchainAddress;

  ///分类
  String? category;

  ///链上地址
  String? chainAddress;
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
  bool? isAi;

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

  ///修改时间
  String? updatedAt;

  Collection({
    this.blockchainAddress,
    this.category,
    this.chainAddress,
    this.commentsNum,
    this.createdAt,
    this.creator,
    this.description,
    this.hotValue,
    this.id,
    this.imageUrl,
    this.isAi,
    this.isOnChain,
    this.likeNum,
    this.name,
    this.onChainTime,
    this.owner,
    this.price,
    this.quantity,
    this.updatedAt,
  });

}