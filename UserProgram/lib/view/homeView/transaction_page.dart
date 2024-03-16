import 'package:flutter/material.dart';
/**
 * 流转中心页
 */

class TransactionPage extends StatefulWidget {
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,  // 指定宽度为屏幕宽度
      height: MediaQuery.of(context).size.height,  // 指定高度为屏幕高度
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.account_circle, size: 80, color: Colors.grey),
          Text('Welcome to Page 3', style: TextStyle(color: Colors.grey, fontSize: 20)),
        ],
      ),
    );
  }
}
