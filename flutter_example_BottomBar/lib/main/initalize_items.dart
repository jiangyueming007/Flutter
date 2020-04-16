
import 'package:flutter/material.dart';

import 'bottom_bar_item.dart';

import '../group/group_page.dart';
import '../home/home_page.dart';
import '../mall/mall_page.dart';
import '../profile/proflie_page.dart';
import '../subject/subject_page.dart';


List<Widget> mainPages = [
  HomePage(),
  SubjectPage(),
  GroupPage(),
  MallPage(),
  ProfilePage()
];

List<BottomNavigationBarItem> mainBarItems = [
  BottomBarItem("home", "首页"),
  BottomBarItem("subject", "书影音"),
  BottomBarItem("group", "小组"),
  BottomBarItem("mall", "市集"),
  BottomBarItem("profile", "我的"),
];
