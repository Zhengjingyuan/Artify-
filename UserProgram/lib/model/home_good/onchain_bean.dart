class OnChainRequest {
  String? category;
  int? page;
  int? size;
  int? sortType;
  String? text;
  OnChainRequest({this.category, this.page, this.size, this.sortType, this.text});
  factory OnChainRequest.fromJson(Map<String, dynamic> json) {
    return OnChainRequest(
      category: json['category'],
      page: json['page'],
      size: json['size'],
      sortType: json['sortType'],
      text: json['text'],
    );
  }
}
class OnChainResponse {
  int? code;
  List<OnChainGood>? data;
  String? msg;
  int? total;
  OnChainResponse({this.code, this.data, this.msg, this.total});
  factory OnChainResponse.fromJson(Map<String, dynamic> json) {
    return OnChainResponse(
      code: json['code'],
      data: json['data'] != null ? (json['data'] as List).map((e) => OnChainGood.fromJson(e)).toList() : null,
      msg: json['msg'],
      total: json['total'],
    );
  }
}
class OnChainGood {
  String? blockchainAddress;
  String? category;
  int? commentsNum;
  String? createdAt;
  int? creator;
  String? description;
  int? hotValue;
  int? id;
  String? imageUrl;
  bool? isOnChain;
  int? likeNum;
  String? name;
  String? onChainTime;
  int? owner;
  double? price;
  int? quantity;
  int? type;
  String? updatedAt;
  OnChainGood({
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
  factory OnChainGood.fromJson(Map<String, dynamic> json) {
    return OnChainGood(
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