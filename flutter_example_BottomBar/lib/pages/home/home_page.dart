import 'dart:async';

import 'package:demo1/model/home_model.dart';

import '../home/home_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<MovieItem> movies = [];

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getMoreData();
      }
    });
    getListData();
  }

  void getListData() {
    HomeRequest.requestMovieList(0).then((res) {
      setState(() {
        movies.clear();
        movies.addAll(res);
      });
    });
  }

  void getMoreData() {
    HomeRequest.requestMovieList(movies.length).then((res) {
      setState(() {
        movies.addAll(res);
      });
    });
  }

  Future<void> _onRefresh() async {
    setState(() {
      getListData();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("首页"),
        ),
        body: Stack(
          children: [
            RefreshIndicator(
              onRefresh: _onRefresh,

              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (BuildContext cont, int index) {
                  return Image.network(movies[index].imageURL);
                },
                controller: scrollController,
              ),
            ),
          ],
        ));
  }
}
