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
                  title: Text('Thumbs and comments',style: TextStyle(color: Colors.white),),
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
                    'Received comments',
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
                  title: Text('User C commented on your post',style: TextStyle(
                    color: Colors.white,
                  )),
                  subtitle: Text('1 day ago',style: TextStyle(
                    color: Colors.white,
                  )),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/profile_image.jpg'),
                  ),
                  title: Text('User D commented on your post',style: TextStyle(
                    color: Colors.white,
                  )),
                  subtitle: Text('2 days ago',style: TextStyle(
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