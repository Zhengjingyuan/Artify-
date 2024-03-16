import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArtifyAppBar{
  final String title;
  final bool canBack;

  ArtifyAppBar({this.title="",this.canBack=true});

  PreferredSizeWidget build(BuildContext context){
    return AppBar(
      centerTitle: true,
      title: Text(title),
      automaticallyImplyLeading: canBack,
    );
  }

}