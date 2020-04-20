import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageDetailPage extends StatelessWidget {
  final String url;

  ImageDetailPage(this.url);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Hero(
          tag: url,
          child: Image.network(
            url,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
      )),
    );
  }
}
