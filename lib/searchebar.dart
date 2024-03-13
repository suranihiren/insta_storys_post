import 'package:flutter/material.dart';
import 'package:uidemo1/home_screen.dart';

class Searchebar extends StatefulWidget {
  const Searchebar({super.key});

  @override
  State<Searchebar> createState() => _SearchebarState();
}

class _SearchebarState extends State<Searchebar> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Center(child: Text("Searche bar"),),
    );
  }
}
