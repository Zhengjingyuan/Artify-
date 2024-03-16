import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:userprogram/common/Routes.dart';
import 'package:userprogram/model/getUser_bean.dart';
import 'package:userprogram/model/update_bean.dart';
import 'package:userprogram/model/user_bean.dart';
import 'package:userprogram/viewmodel/getUser_viewmodel.dart';
import 'package:userprogram/viewmodel/login_viewmodel.dart';


class UserUpdatePage extends StatefulWidget {
   // final UserUpdateDto user;
   // UserUpdatePage({required this.user});

  @override
  _UserUpdatePageState createState() => _UserUpdatePageState();
}

class _UserUpdatePageState extends State<UserUpdatePage> {
  String _nickname = 'User123';
  String _phone = '1234567890';
  String _bio = 'Hello, I am User123';
  String? _avatarImage ;
  final ImagePicker _picker = ImagePicker();
  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _avatarImage = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Edit Profile'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _avatarImage != null
                        ? FileImage(File(_avatarImage!)) as ImageProvider<Object>
                        : AssetImage('assets/default_avatar.png'),
                  ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Nickname',
                ),
                onChanged: (value) {
                  setState(() {
                    _nickname = value;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Phone',
                ),
                onChanged: (value) {
                  setState(() {
                    _phone = value;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Bio',
                ),
                onChanged: (value) {
                  setState(() {
                    _bio = value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add logic to save profile changes
                  update(_phone,_nickname,_bio);
                  Navigator.pushReplacementNamed(context, Routes.homeRoute);

                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void update(String phoneNumber, String nickName,String signature) {
    LoginViewModel loginViewModel = LoginViewModel();
    GetUserViewMode getUserViewMode=GetUserViewMode();

    UpRequest updateRequest = UpRequest(
      id: loginViewModel.currentUser.id,
      headImg: "https://img2.baidu.com/it/u=396436058,219850851&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
      nickName: nickName,
      phone: phoneNumber,
    );

      // 调用登录方法
      loginViewModel.update(updateRequest);
      getUserViewMode.updateUser(updateRequest);
    }
  }




