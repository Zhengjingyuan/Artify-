import 'package:flutter/material.dart';
class LikeAndCommentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assert/bk.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppBar(
                  centerTitle: true,
                  title: Text('赞和评论',style: TextStyle(color: Colors.white),),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);

                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '收到的赞',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/profile_image.jpg'),
                  ),
                  title: Text('用户A 赞了您的帖子',style: TextStyle(
                    color: Colors.white,
                  )),
                  subtitle: Text('3小时前',style: TextStyle(
                    color: Colors.white,
                  )),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/profile_image.jpg'),
                  ),
                  title: Text('用户B 赞了您的帖子',style: TextStyle(
                    color: Colors.white,

                  )),
                  subtitle: Text('5小时前',style: TextStyle(
                    color: Colors.white,

                  )),
                ),
                // 可以根据需要添加更多收到的赞的列表项
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '收到的评论',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/profile_image.jpg'),
                  ),
                  title: Text('用户C 评论了您的帖子',style: TextStyle(
                    color: Colors.white,
                  )),
                  subtitle: Text('1天前',style: TextStyle(
                    color: Colors.white,
                  )),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/profile_image.jpg'),
                  ),
                  title: Text('用户D 评论了您的帖子',style: TextStyle(
                    color: Colors.white,
                  )),
                  subtitle: Text('2天前',style: TextStyle(
                    color: Colors.white,
                  )),
                ),
                // 可以根据需要添加更多收到的评论的列表项
              ],
            ),
          ),
        ],
      ),
    );
  }
}
void main() {
  runApp(MaterialApp(
    home: LikeAndCommentPage(),
  ));
}