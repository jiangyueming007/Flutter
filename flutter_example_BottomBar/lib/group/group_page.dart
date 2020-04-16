import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroupPage extends StatefulWidget {
  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("小组"),
      ),
      body: Center(
        child: Text("小组页"),
      ),
    );;
  }
}