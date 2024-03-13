import 'package:flutter/material.dart';

class NavModel {
  final Widget page;
  final GlobalKey<NavigatorState> navKey;

  NavModel({required this.page, required this.navKey});
}
class PostModel{
  String? profileImage;
  String? title;
  String? title2;
  String? profilePost;
  int likes = 0;
  List chat = [];
  int chatnumber = 0;
  String? description;
  PostModel({required this.profileImage,this.title,this.profilePost,required this.likes,required this.chat,this.description,this.title2,required this.chatnumber});
}