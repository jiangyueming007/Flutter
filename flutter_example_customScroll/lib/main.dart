import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CustomScrollView',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: MyContent(),
    );
  }
}
class MyContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          flexibleSpace: Image.asset("images/fight.jpeg",fit: BoxFit.cover,),
          expandedHeight: 200,
        ),
        SliverGrid(
            delegate: SliverChildBuilderDelegate(
                (BuildContext cont,int index){
                  return Container(color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)),);
                },
              childCount: 6,
            ),
            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount (
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1.5,
            ),
        ),
        SliverList(delegate: SliverChildBuilderDelegate(
            (BuildContext cont,int index){
              return Container(
                height: 60,
                child: Text("这是一行文字：$index",style: TextStyle(fontSize: 20),),
              );
            }
        ))
      ],
    );
  }
}