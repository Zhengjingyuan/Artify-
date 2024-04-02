import 'package:flutter/material.dart';
import 'package:userprogram/model/home_good/onchain_bean.dart';

class TransactionDetailPage extends StatefulWidget {
  final OnChainGood product;
  TransactionDetailPage(this.product);


  @override
  _TransactionDetailPageState createState() => _TransactionDetailPageState();
}

class _TransactionDetailPageState extends State<TransactionDetailPage> {
  late OnChainGood _product;
  @override
  void initState() {
    _product = widget.product;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assert/bk.png'), // 替换成你想要设置的背景图片路径
              fit: BoxFit.cover, // 适应容器大小，可以根据需求调整
            ),
          ),
          child: Stack(
            children: [
              Image.asset(
                'lib/assert/bk.png',
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),

              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  _product.imageUrl!,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
              ),

              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AppBar(
                  centerTitle: true,
                  title: Text('藏品详情',style: TextStyle(color: Colors.white),),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.39,
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _product.name!,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white)
                      ),
                      child: Text('互换',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),

                    SizedBox(height: 40,),
                    Text('用户需求',style: TextStyle(color: Colors.white,fontSize: 14),),
                    SizedBox(height: 10,),
                    Image.asset('lib/assert/Line 6.png'),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 14, 40, 14),
                      height: 80,
                      child: Text('    自然风景，人文类可换，偏好花鸟鱼虫，其他类型亦可联系，仅限原创作品。',style: TextStyle(color: Colors.white,fontSize: 14)),
                    ),
                    SizedBox(height: 40,),
                    Text('联系方式',style: TextStyle(color: Colors.white,fontSize: 14),),
                    SizedBox(height: 10,),
                    Image.asset('lib/assert/Line 6.png'),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 14, 40, 14),
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('email：2554146481@qq.com',style: TextStyle(color: Colors.white,fontSize: 14)),
                          SizedBox(height: 10,),
                          Text('phone:  (+86)15455416784',style: TextStyle(color: Colors.white,fontSize: 14)),
                          SizedBox(height: 10,),
                          Text('QQ:  2554146481',style: TextStyle(color: Colors.white,fontSize: 14)),
                        ],
                      )
                    )

                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
