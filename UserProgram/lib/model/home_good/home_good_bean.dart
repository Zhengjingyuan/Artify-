class Product {
  String image; // 商品图片
  String name; // 商品名
  String author; // 作者
  String description; // 商品介绍
  String tag; // 商品标签
  double price; // 商品价格
  Product({
    required this.image,
    required this.name,
    required this.author,
    required this.description,
    required this.tag,
    required this.price,
  });
}