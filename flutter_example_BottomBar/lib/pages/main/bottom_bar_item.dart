import 'package:flutter/cupertino.dart';

class BottomBarItem extends BottomNavigationBarItem {
  BottomBarItem (String iconName,String title):super(
    title:Text(title,),
    icon:Image.asset("images/$iconName.png",width: 32,gaplessPlayback: true,),
    activeIcon:Image.asset("images/${iconName}_active.png",width: 32,gaplessPlayback: true,),
  );
}