
import 'initalize_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyMainPage extends StatefulWidget {
  @override
  _MyMainPageState createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  @override
  int _tabIndex = 0;
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: IndexedStack(
        index:  _tabIndex,
        children: mainPages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:mainBarItems,
        currentIndex: _tabIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.green,
        unselectedFontSize: 10,
        selectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
        setState(() {
          _tabIndex = index;
        });
        },
      ),
    );
  }
}


