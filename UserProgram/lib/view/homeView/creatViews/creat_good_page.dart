import 'package:flutter/material.dart';
import 'package:userprogram/base/components/DropdowmMenu.dart';

/**
 * 孵化池的下部分商品页面
 */
class CreateGoodPage extends StatefulWidget {

  @override
  _CreateGoodPageState createState() => _CreateGoodPageState();
}

class _CreateGoodPageState extends State<CreateGoodPage> {
  String _selectedValue = '3'; // 默认选中第三个
  void _onSelected(String value) {
    setState(() {
      _selectedValue = value;
    });
    // 根据选中的value加载不同内容
    // 根据具体业务逻辑编写不同页面的展示
  }
  @override
  Widget build(BuildContext context) {
    Widget _goodWidget = page1();
    if (_selectedValue == '2') {
      _goodWidget = page2();
    } else if (_selectedValue == '3') {
      _goodWidget = page3();
    }
    return Container(
      height: 300, // 设置组件的高度为600
      child: Scaffold(
        appBar: AppBar(
          title: Text('作品展示'),
          actions: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10), // 添加圆角
              ),
              width: 130,
              alignment: Alignment.centerRight,
              child: DropMenuWidget(
                leading: const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text('选择标签：'),
                ),
                data: const [
                  {'label': '默认', 'value': '1'},
                  {'label': '原创', 'value': '2'},
                  {'label': 'AI', 'value': '3'},
                ],
                selectCallBack: _onSelected,
                offset: const Offset(0, 40),
                selectedValue: _selectedValue,
              ),
            ),
          ],
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 400), // 添加一个最大宽度约束
            child: _goodWidget,
          ),
        ),
      ),
    );
  }

  Widget page1() {
    return Container(
      child: Center(
        child: Text('默认'),
      ),
    );
  }
  Widget page2() {
    return Container(
      child: Center(
        child: Text('原创'),
      ),
    );
  }

  Widget page3() {
    return Container(
      child: Center(
        child: Text('AI'),
      ),
    );
  }
}
